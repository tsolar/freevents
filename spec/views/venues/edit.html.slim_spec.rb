# frozen_string_literal: true

require "rails_helper"

RSpec.describe "venues/edit", type: :view do
  before do
    @venue = assign(:venue, Venue.create!(
                              name: "MyString",
                              description: "MyText",
                              address: "MyString",
                              lat: 1.5,
                              lng: 1.5
                            ))
  end

  it "renders the edit venue form" do
    render

    assert_select "form[action=?][method=?]", venue_path(@venue), "post" do
      assert_select "input[name=?]", "venue[name]"

      assert_select "textarea[name=?]", "venue[description]"

      assert_select "input[name=?]", "venue[address]"

      assert_select "input[name=?]", "venue[lat]"

      assert_select "input[name=?]", "venue[lng]"
    end
  end
end
