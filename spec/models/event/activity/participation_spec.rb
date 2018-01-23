require "rails_helper"

RSpec.describe Event::Activity::Participation, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event_activity }
    it { should validate_presence_of :event_participation }
  end

  describe "Relationships" do
    it {
      should belong_to(:event_activity)
        .class_name("Event::Activity")
    }

    it {
      should belong_to(:event_participation)
        .class_name("Event::Participation")
    }
  end
end
