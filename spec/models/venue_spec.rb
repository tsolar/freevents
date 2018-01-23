require "rails_helper"

RSpec.describe Venue, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
  end

  describe "Relationships" do
    it { should have_many(:event_venues)
                 .class_name("Event::Venue") }
    it { should have_many(:events)
                 .class_name("Event")
                 .through(:event_venues) }
  end
end
