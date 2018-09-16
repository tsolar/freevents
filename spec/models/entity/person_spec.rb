require "rails_helper"

RSpec.describe Entity::Person, type: :model do
  describe "Validations" do
    it { should validate_presence_of :firstname }
    it { should_not validate_presence_of :lastname }
    it { should validate_length_of(:bio).is_at_most(300) }
  end

  describe "Relationships" do
    it {
      # these will be Event::Attendees, per example
      should have_many(:event_participations)
        .class_name("Event::Participation")
    }

    it {
      should have_many(:emails)
        .class_name("::Email")
    }

    it { should belong_to(:user).inverse_of(:person) }
  end

  describe "#full_name" do
    let(:person) { create(:entity_person) }

    it "returns first name and last name" do
      expect(person.full_name).to eq "#{person.firstname} #{person.lastname}"
    end

    context "when lastname is nil" do
      let(:person) { create(:entity_person, lastname: nil) }

      it "returns only the first name" do
        expect(person.full_name).to eq person.firstname
      end
    end
  end
end
