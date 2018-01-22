require 'rails_helper'

RSpec.describe "entity/organizations/new", type: :view do
  before(:each) do
    assign(:entity_organization, Entity::Organization.new(
      :type => "",
      :name => "MyString"
    ))
  end

  it "renders new entity_organization form" do
    render

    assert_select "form[action=?][method=?]", entity_organizations_path, "post" do

      assert_select "input[name=?]", "entity_organization[type]"

      assert_select "input[name=?]", "entity_organization[name]"
    end
  end
end
