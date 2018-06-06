require "rails_helper"

RSpec.describe Event::Activity::Postulation, type: :model do
  describe "Validations" do
    it { should validate_presence_of :postulant_firstname }
    it { should validate_presence_of :postulant_lastname }
    it { should validate_presence_of :postulant_email }
    it { should validate_presence_of :activity_title }
    it { should validate_presence_of :activity_description }

    it { should validate_length_of(:postulant_bio).is_at_most(300) }

    it {
      should validate_inclusion_of(:activity_type)
        .in_array(Event::Activity::Postulation::ACTIVITY_TYPES)
    }

    it {
      should validate_inclusion_of(:activity_difficulty_level)
        .in_array(Event::Activity::Postulation::ACTIVITY_DIFFICULTY_LEVELS)
    }
  end

  describe "Relationships" do
    it { should belong_to :event }
    it { should have_many(:event_days).through(:event).source(:days) }
    it { should have_one(:event_activity)
                 .class_name("Event::Activity")
                 .with_foreign_key(:event_activity_postulation_id) }
  end

  describe "Create" do
    it "should create a valid Event::Activity::Postulation, and nothing else" do
      postulation = FactoryBot.build(:event_activity_postulation)
      expect {
        postulation.save
      }.to change(Event::Activity::Participation, :count).by(0)
        .and change(Event::Activity::Postulation, :count).by(1)
        .and change(Event::Activity, :count).by(0)
        .and change(Event::Participation, :count).by(0)
        .and change(Entity::Person, :count).by(0)

      expect(postulation.valid?).to be true
      expect(postulation.persisted?).to be true
    end

    it "should not create an invalid Event::Activity::Postulation" do
      postulation = FactoryBot.build(:event_activity_postulation, :invalid)
      expect {
        expect(postulation.save).to be false
      }.to change(Event::Activity::Participation, :count).by(0)
        .and change(Event::Activity::Postulation, :count).by(0)
        .and change(Event::Activity, :count).by(0)
        .and change(Event::Participation, :count).by(0)
        .and change(Entity::Person, :count).by(0)

      expect(postulation.valid?).to be false
      expect(postulation.persisted?).to be false
    end
  end

  describe "#approve" do
    context "speaker does not exists (identified by email)" do
      it "creates the speaker and the activity" do
        postulation = FactoryBot.create(:event_activity_postulation)

        expect(Event::Activity::PostulationMailer).to receive(:send_approve_notification_to_postulant).with(postulation).once.and_call_original

        expect {
          postulation.approve
        }.to change(Event::Activity::Participation, :count).by(1)
          .and change(Event::Activity, :count).by(1)
          .and change(Event::Participation, :count).by(1)
          .and change(Entity::Person, :count).by(1)
          .and have_enqueued_job.on_queue("freevents-#{Rails.env}.mailers").exactly(:once)

        ea = Event::Activity.last
        expect(ea.title).to eq postulation.activity_title
        expect(ea.description).to eq postulation.activity_description
        expect(ea.event).to eq postulation.event
        expect(ea.postulation.id).to eq postulation.id

        ep = Event::Participation.last
        expect(ep.participant.firstname).to eq postulation.postulant_firstname
        expect(ep.participant.lastname).to eq postulation.postulant_lastname
        expect(ep.participant.bio).to eq postulation.postulant_bio
        expect(ep.participant.emails.first.address).to eq postulation.postulant_email
        # pending:
        # expect(ep.participant.phone_numbers.first.number).to eq postulation.postulant_phone_number

        eap = Event::Activity::Participation.last
        expect(eap.event_activity).to eq ea
        expect(eap.event_participation).to eq ep
        expect(eap.type).to eq "Event::Activity::Speaker"
      end
    end

    context "speaker already exists (identified by email)" do
      it "should create the activity and assign speaker to it" do
        person = FactoryBot.create(:entity_person)
        person.emails.create(address: "person@example.com")

        # creates a postulation with a postulant that have an existing email
        postulation = FactoryBot.create(
          :event_activity_postulation,
          postulant_firstname: person.firstname,
          postulant_lastname: person.lastname,
          postulant_bio: person.bio,
          postulant_email: person.emails.first
        )

        expect(Event::Activity::PostulationMailer).to receive(:send_approve_notification_to_postulant).with(postulation).once.and_call_original

        expect {
          postulation.approve
        }.to change(Event::Activity::Participation, :count).by(1)
          .and change(Event::Activity, :count).by(1)
          .and change(Event::Participation, :count).by(1)
          .and change(Entity::Person, :count).by(0)
          .and change(Email, :count).by(0)
          .and have_enqueued_job.on_queue("freevents-#{Rails.env}.mailers").exactly(:once)

        ea = Event::Activity.last
        expect(ea.title).to eq postulation.activity_title
        expect(ea.description).to eq postulation.activity_description
        expect(ea.event).to eq postulation.event
        expect(ea.postulation.id).to eq postulation.id

        ep = Event::Participation.last
        expect(ep.participant.firstname).to eq postulation.postulant_firstname
        expect(ep.participant.lastname).to eq postulation.postulant_lastname
        expect(ep.participant.bio).to eq postulation.postulant_bio
        expect(ep.participant.emails.first.address).to eq postulation.postulant_email
        # pending:
        # expect(ep.participant.phone_numbers.first.number).to eq postulation.postulant_phone_number

        eap = Event::Activity::Participation.last
        expect(eap.event_activity).to eq ea
        expect(eap.event_participation).to eq ep
        expect(eap.type).to eq "Event::Activity::Speaker"
      end
    end
  end

end
