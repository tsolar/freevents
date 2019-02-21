# frozen_string_literal: true

require "rails_helper"

RSpec.describe "venue/rooms/index", type: :view do
  before do
    assign(:venue_rooms, create_list(:venue_room, 2))
  end

  it "renders a list of venue/rooms" do
    skip("maybe not needed")
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
