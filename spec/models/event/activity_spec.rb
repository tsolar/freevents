require "rails_helper"

RSpec.describe Event::Activity, type: :model do
  describe "Validations" do
    it { should validate_presence_of :event_day }
  end

  describe "Relationships" do
    it { should belong_to(:event_day)
              .class_name("Event::Day") }

    it { should have_many(:participations)
              .class_name("Event::Activity::Participation")
              .with_foreign_key(:event_activity_id)
              .dependent(:destroy) }

    it { should have_many(:speakers)
              .class_name("Event::Activity::Speaker")
              .with_foreign_key(:event_activity_id)
              .dependent(:destroy) }

    it { should belong_to(:postulation)
        .class_name("Event::Activity::Postulation")
        .with_foreign_key(:event_activity_postulation_id)
      # .optional(true)
    }

    it { should delegate_method(:event).to(:event_day) }
  end
end
