require "rails_helper"

RSpec.describe Event::Day, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
  end

  describe "Relationships" do
    it { should belong_to(:event)
                 .inverse_of(:days) }
    it {
      should have_many(:activities)
              .class_name("Event::Activity")
              .with_foreign_key(:event_day_id)
    }
  end

  describe "Create" do
    it "should create a valid Event Day" do
      event_day = FactoryBot.create(:event_day)
      expect(event_day.valid?).to be true
      expect(event_day.persisted?).to be true
    end
  end
end
