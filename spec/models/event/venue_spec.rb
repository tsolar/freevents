require "rails_helper"

RSpec.describe Event::Venue, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event }
    it { should validate_presence_of :venue }
  end

  describe "Relationships" do
    it { should belong_to(:event) }
    it { should belong_to(:venue)
                 .class_name("::Venue")}
  end
end
