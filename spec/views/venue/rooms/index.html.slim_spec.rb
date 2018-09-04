require 'rails_helper'

RSpec.describe "venue/rooms/index", type: :view do
  before(:each) do
    assign(:venue_rooms, [
      Venue::Room.create!(
        :venue => nil,
        :name => "Name",
        :capacity => 2
      ),
      Venue::Room.create!(
        :venue => nil,
        :name => "Name",
        :capacity => 2
      )
    ])
  end

  it "renders a list of venue/rooms" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
