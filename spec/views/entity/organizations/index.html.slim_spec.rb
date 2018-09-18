# frozen_string_literal: true

require "rails_helper"

RSpec.describe "entity/organizations/index", type: :view do
  before do
    assign(:entity_organizations, create_list(:entity_organization, 2))
  end

  it "renders a list of entity/organizations" do
    render
    assert_select "tr>td", text: Entity::Organization.first.name.to_s, count: 1
    assert_select "tr>td", text: Entity::Organization.second.name.to_s, count: 1
  end
end
