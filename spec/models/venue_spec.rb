# frozen_string_literal: true

require "rails_helper"

RSpec.describe Venue, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :address }
  end

  describe "Relationships" do
    it {
      is_expected.to have_many(:event_venues)
        .class_name("Event::Venue")
    }

    it {
      is_expected.to have_many(:events)
        .class_name("Event")
        .through(:event_venues)
    }

    it {
      is_expected.to have_many(:rooms)
        .class_name("Venue::Room")
      # .with_foreign_key(:venue_room_id)
    }
  end
end
