# frozen_string_literal: true

require "rails_helper"

RSpec.describe "entity/people/edit", type: :view do
  before do
    @entity_person = assign(
      :entity_person,
      create(:entity_person)
    )
  end

  it "renders the edit entity_person form" do
    render

    assert_select "form[action=?][method=?]", entity_person_path(@entity_person), "post" do
      assert_select "input[name=?]", "entity_person[firstname]"

      assert_select "input[name=?]", "entity_person[lastname]"

      assert_select "textarea[name=?]", "entity_person[bio]"
    end
  end
end
