# frozen_string_literal: true

require "rails_helper"

RSpec.xdescribe "venues/new", type: :view do
  before do
    assign(:venue, Venue.new(
                     name: "MyString",
                     description: "MyText",
                     address: "MyString",
                     lat: 1.5,
                     lng: 1.5
                   ))
  end

  it "renders new venue form" do
    render

    assert_select "form[action=?][method=?]", venues_path, "post" do
      assert_select "input[name=?]", "venue[name]"

      assert_select "textarea[name=?]", "venue[description]"

      assert_select "input[name=?]", "venue[address]"

      assert_select "input[name=?]", "venue[lat]"

      assert_select "input[name=?]", "venue[lng]"
    end
  end
end
