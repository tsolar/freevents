require 'rails_helper'

RSpec.describe "entity/organizations/show", type: :view do
  before(:each) do
    @entity_organization = assign(:entity_organization, Entity::Organization.create!(
      :type => "Type",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Name/)
  end
end
