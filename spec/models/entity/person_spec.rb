require "rails_helper"

RSpec.describe Entity::Person, type: :model do
  describe "Validations" do
    it { should validate_presence_of :firstname }
    it { should validate_presence_of :lastname }
  end

  describe "Relationships" do
    it { should have_many(:event_participations)
                 .class_name("Event::Participation") }

    it { should have_many(:emails)
                 .class_name("::Email") }
  end

end
