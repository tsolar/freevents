# frozen_string_literal: true

require "rails_helper"

RSpec.describe Venue::Room, type: :model do
  it { is_expected.to belong_to(:venue).inverse_of(:rooms) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:venue_id) }

  it { is_expected.to allow_value(1).for(:capacity) }
  it { is_expected.not_to allow_value(0).for(:capacity) }
  it { is_expected.not_to allow_value(-1).for(:capacity) }

  it "has a valid factory" do
    room = build(:venue_room)
    expect(room).to be_valid
  end
end
