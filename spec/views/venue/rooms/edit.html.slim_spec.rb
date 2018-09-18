# frozen_string_literal: true

require "rails_helper"

RSpec.describe "venue/rooms/edit", type: :view do
  before do
    @venue_room = assign(:venue_room, create(:venue_room))
  end

  it "renders the edit venue_room form" do
    skip("maybe not needed")

    render

    assert_select "form[action=?][method=?]", venue_room_path(@venue_room), "post" do
      assert_select "input[name=?]", "venue_room[venue_id]"

      assert_select "input[name=?]", "venue_room[name]"

      assert_select "input[name=?]", "venue_room[capacity]"
    end
  end
end
