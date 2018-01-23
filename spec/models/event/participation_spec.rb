require "rails_helper"

RSpec.describe Event::Participation, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event }
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
  end
end
