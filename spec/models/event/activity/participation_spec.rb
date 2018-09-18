# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Activity::Participation, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :event_activity }
    it { is_expected.to validate_presence_of :event_participation }
  end

  describe "Relationships" do
    it {
      is_expected.to belong_to(:event_activity)
        .class_name("Event::Activity")
    }

    it {
      is_expected.to belong_to(:event_participation)
        .class_name("Event::Participation")
    }
  end
end
