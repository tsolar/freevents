# frozen_string_literal: true

require "rails_helper"

RSpec.describe "entity/organizations/show", type: :view do
  before do
    @entity_organization = assign(
      :entity_organization, create(:entity_organization, name: "o'clock")
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@entity_organization.name)}/)
  end
end
