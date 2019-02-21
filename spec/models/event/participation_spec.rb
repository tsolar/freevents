# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Participation, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :event }
    it { is_expected.to validate_presence_of :participant }
  end

  describe "Relationships" do
    it { is_expected.to belong_to :event }
    it { is_expected.to belong_to :participant }
  end

  describe "Create" do
    it "creates a valid Event::Participation" do
      ep = create(:event_participation)
      expect(ep.valid?).to be true
      expect(ep.persisted?).to be true
    end

    context "when attributes are invalid" do
      it "does not create the Event::Participation" do
        ep_invalid = build(:event_participation, :invalid)
        expect(ep_invalid.valid?).to be false
        expect(ep_invalid.save).to be false
        expect(ep_invalid.persisted?).to be false
      end
    end
  end
end
