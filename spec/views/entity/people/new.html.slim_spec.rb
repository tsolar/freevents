# frozen_string_literal: true

require "rails_helper"

RSpec.describe "entity/people/new", type: :view do
  before do
    assign(:entity_person, Entity::Person.new(
                             firstname: "MyString",
                             lastname: "MyString",
                             bio: "MyText"
                           ))
  end

  it "renders new entity_person form" do
    render

    assert_select "form[action=?][method=?]", entity_people_path, "post" do
      assert_select "input[name=?]", "entity_person[firstname]"

      assert_select "input[name=?]", "entity_person[lastname]"

      assert_select "textarea[name=?]", "entity_person[bio]"
    end
  end
end
