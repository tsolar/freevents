# frozen_string_literal: true

require "rails_helper"

RSpec.describe Venue, type: :model do
  subject(:venue) { build(:venue) }

  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :address }
    it do
      expect(venue).to accept_nested_attributes_for(:rooms).allow_destroy(true)
    end
  end

  describe "Relationships" do
    it {
      expect(venue).to have_many(:event_venues)
        .class_name("Event::Venue")
    }

    it {
      expect(venue).to have_many(:events)
        .class_name("Event")
        .through(:event_venues)
    }

    it {
      expect(venue).to have_many(:rooms)
        .class_name("Venue::Room")
      # .with_foreign_key(:venue_room_id)
    }
  end
end
