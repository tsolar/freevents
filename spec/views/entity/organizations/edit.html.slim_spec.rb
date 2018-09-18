# frozen_string_literal: true

require "rails_helper"

RSpec.describe "entity/organizations/edit", type: :view do
  before do
    @entity_organization = assign(:entity_organization, Entity::Organization.create!(
                                                          type: "",
                                                          name: "MyString"
                                                        ))
  end

  it "renders the edit entity_organization form" do
    render

    assert_select "form[action=?][method=?]", entity_organization_path(@entity_organization), "post" do
      assert_select "input[name=?]", "entity_organization[type]"

      assert_select "input[name=?]", "entity_organization[name]"
    end
  end
end
