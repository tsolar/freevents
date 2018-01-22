require 'rails_helper'

RSpec.describe "entity/organizations/index", type: :view do
  before(:each) do
    assign(:entity_organizations, [
      Entity::Organization.create!(
        :type => "Type",
        :name => "Name"
      ),
      Entity::Organization.create!(
        :type => "Type",
        :name => "Name"
      )
    ])
  end

  it "renders a list of entity/organizations" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
