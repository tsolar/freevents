require 'rails_helper'

RSpec.describe "venue/rooms/show", type: :view do
  before(:each) do
    @venue_room = assign(:venue_room, Venue::Room.create!(
      :venue => nil,
      :name => "Name",
      :capacity => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
