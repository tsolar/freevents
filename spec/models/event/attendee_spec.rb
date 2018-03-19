require "rails_helper"

RSpec.describe Event::Attendee, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event }
  end

  describe "Relationships" do
    it { should belong_to :event }
    it { should belong_to :participant }
    it {
      should have_one(:answer)
        .class_name("Event::Participation::Answer")
        .with_foreign_key(:event_participation_id)
        .inverse_of(:attendee)
    }
  end

  describe "Create" do
    it "should create a valid Event::Attendee and an Event::Participation::Confirmation" do
      expect {
        attendee = FactoryBot.create(:event_attendee)
        expect(attendee.valid?).to be true
        expect(attendee).to be_persisted
        expect(attendee.answer).to be_a Event::Participation::Answer
        expect(attendee.answer).to be_persisted
      }.to change(Event::Participation, :count).by(1)
        .and change(Event::Participation::Answer, :count).by(1)
    end

    context "when attributes are invalid" do
      it "should not create the Event::Attendee nor an Event::Participation::Confirmation" do
        attendee_invalid = FactoryBot.build(:event_attendee, :invalid)
        expect(attendee_invalid.valid?).to be false
        expect(attendee_invalid.save).to be false
        expect(attendee_invalid.persisted?).to be false
        expect(attendee_invalid.answer).to be nil
      end
    end
  end
end