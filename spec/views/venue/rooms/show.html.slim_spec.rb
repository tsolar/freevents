# frozen_string_literal: true

require "rails_helper"

RSpec.describe "venue/rooms/show", type: :view do
  before do
    @venue_room = assign(:venue_room, create(:venue_room))
  end

  it "renders attributes in <p>" do
    skip("maybe not needed")

    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
