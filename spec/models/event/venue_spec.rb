# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Venue, type: :model do
  subject { build(:event_venue) }

  describe "Validations" do
    it { is_expected.to validate_presence_of :event }
    it { is_expected.to validate_presence_of :venue }
  end

  describe "Relationships" do
    subject { build(:event_venue) }

    it { is_expected.to belong_to(:event) }
    it {
      is_expected.to belong_to(:venue)
        .class_name("::Venue")
    }
  end
end
