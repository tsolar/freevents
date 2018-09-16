require 'rails_helper'

RSpec.describe Venue::Room, type: :model do
  it { should belong_to(:venue).inverse_of(:rooms) }

  it { should validate_presence_of(:name) }

  it { should allow_value(1).for(:capacity) }
  it { should_not allow_value(0).for(:capacity) }
  it { should_not allow_value(-1).for(:capacity) }

  it "has a valid factory" do
    room = build(:venue_room)
    expect(room).to be_valid
  end
end
