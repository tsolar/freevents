# frozen_string_literal: true

require "rails_helper"

RSpec.xdescribe "venues/show", type: :view do
  before do
    @venue = assign(:venue, Venue.create!(
                              name: "Name",
                              description: "MyText",
                              address: "Address",
                              lat: 2.5,
                              lng: 3.5
                            ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
