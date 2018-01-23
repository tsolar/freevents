require "rails_helper"

RSpec.describe "venues/new", type: :view do
  before(:each) do
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
