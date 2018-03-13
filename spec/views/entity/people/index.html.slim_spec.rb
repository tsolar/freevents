require "rails_helper"

RSpec.describe "entity/people/index", type: :view do
  before(:each) do
    assign(
      :entity_people,
      FactoryBot.create_list(:entity_person, 2)
    )
  end

  it "renders a list of entity/people" do
    render
    assert_select "tr>td", text: Entity::Person.first.firstname.to_s, count: 1
    assert_select "tr>td", text: Entity::Person.last.firstname.to_s, count: 1

    assert_select "tr>td", text: Entity::Person.first.lastname.to_s, count: 1
    assert_select "tr>td", text: Entity::Person.last.lastname.to_s, count: 1
  end
end
