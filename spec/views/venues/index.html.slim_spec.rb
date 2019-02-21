# frozen_string_literal: true

require "rails_helper"

RSpec.describe "venues/index", type: :view do
  before do
    assign(:venues, create_list(:venue, 2))
  end

  it "renders a list of venues" do
    skip "assign does not work"
    render
    assert_select "tr>td", text: assigns(:venues).first.name.to_s, count: 1
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
  end
end
