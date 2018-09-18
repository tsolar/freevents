# frozen_string_literal: true

require "rails_helper"

RSpec.describe Entity::Person, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :firstname }
    it { is_expected.not_to validate_presence_of :lastname }
    it { is_expected.to validate_length_of(:bio).is_at_most(300) }
  end

  describe "Relationships" do
    it {
      # these will be Event::Attendees, per example
      is_expected.to have_many(:event_participations)
        .class_name("Event::Participation")
    }

    it {
      is_expected.to have_many(:emails)
        .class_name("::Email")
    }

    it { is_expected.to belong_to(:user).inverse_of(:person) }
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
