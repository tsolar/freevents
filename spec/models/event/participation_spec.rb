require "rails_helper"

RSpec.describe Event::Participation, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event }
    it { should validate_presence_of :participant }
  end

  describe "Relationships" do
    it { should belong_to :event }
    it { should belong_to :participant }
  end

  describe "Create" do
    it "should create a valid Event::Participation" do
      ep = FactoryBot.create(:event_participation)
      expect(ep.valid?).to be true
      expect(ep.persisted?).to be true
    end

    context "when attributes are invalid" do
      it "should not create the Event::Participation" do
        ep_invalid = FactoryBot.build(:event_participation, :invalid)
        expect(ep_invalid.valid?).to be false
        expect(ep_invalid.save).to be false
        expect(ep_invalid.persisted?).to be false
      end
    end
  end
end
