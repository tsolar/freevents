require "rails_helper"

RSpec.describe Event, type: :model do
  describe "Validations" do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }

    it { should validate_presence_of :days }
    it { should accept_nested_attributes_for(:days)
                 .allow_destroy(true) }

  end

  describe "Relationships" do
    it { should have_many(:days)
                 .inverse_of(:event)
                 .dependent(:destroy) }
    it { should have_many(:participations)
                 .dependent(:destroy) }
    it { should have_many(:activities)
                 .class_name("Event::Activity")
                 .through(:days)
                 .dependent(:destroy) }
    it { should have_many(:event_venues)
                 .class_name("Event::Venue")
                 .dependent(:destroy) }
    it { should have_many(:venues)
                 .class_name("::Venue")
                 .through(:event_venues) }

    it {
      should belong_to(:owner)
        .inverse_of(:events)
        .class_name("User")
        .with_foreign_key(:owner_id)
    }
  end

  describe "to_s" do
    it "returns title" do
      event_title = FFaker::Lorem.sentence
      event = FactoryBot.create(:event, title: event_title)
      expect("#{event}").to eq event_title
    end
  end

  describe "Create" do
    it "should create a valid Event" do
      event = FactoryBot.create(:event)
      expect(event.valid?).to be true
      expect(event.persisted?).to be true
      expect(event.days.count).to be 1
    end

  end
end
