require "rails_helper"

RSpec.describe Entity::Person, type: :model do
  describe "Validations" do
    it { should validate_presence_of :firstname }
    it { should validate_presence_of :lastname }
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

end
