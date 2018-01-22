require 'rails_helper'

RSpec.describe "entity/people/show", type: :view do
  before(:each) do
    @entity_person = assign(:entity_person, Entity::Person.create!(
      :firstname => "Firstname",
      :lastname => "Lastname",
      :bio => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/MyText/)
  end
end
