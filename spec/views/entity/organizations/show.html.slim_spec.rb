require "rails_helper"

RSpec.describe "entity/organizations/show", type: :view do
  before(:each) do
    @entity_organization = assign(:entity_organization, create(:entity_organization))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@entity_organization.name}/)
  end
end
