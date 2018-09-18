# frozen_string_literal: true

require "rails_helper"

RSpec.describe "venue/rooms/new", type: :view do
  before do
    assign(:venue_room, create(:venue_room))
  end

  it "renders new venue_room form" do
    skip("maybe not needed")

    render

    assert_select "form[action=?][method=?]", venue_rooms_path, "post" do
      assert_select "input[name=?]", "venue_room[venue_id]"

      assert_select "input[name=?]", "venue_room[name]"

      assert_select "input[name=?]", "venue_room[capacity]"
    end
  end
end
