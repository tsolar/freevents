require 'rails_helper'

RSpec.describe "entity/people/index", type: :view do
  before(:each) do
    assign(:entity_people, [
      Entity::Person.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :bio => "MyText"
      ),
      Entity::Person.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :bio => "MyText"
      )
    ])
  end

  it "renders a list of entity/people" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
