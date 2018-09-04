require 'rails_helper'

RSpec.describe "venue/rooms/new", type: :view do
  before(:each) do
    assign(:venue_room, Venue::Room.new(
      :venue => nil,
      :name => "MyString",
      :capacity => 1
    ))
  end

  it "renders new venue_room form" do
    render

    assert_select "form[action=?][method=?]", venue_rooms_path, "post" do

      assert_select "input[name=?]", "venue_room[venue_id]"

      assert_select "input[name=?]", "venue_room[name]"

      assert_select "input[name=?]", "venue_room[capacity]"
    end
  end
end
