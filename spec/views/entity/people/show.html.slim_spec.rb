# frozen_string_literal: true

require "rails_helper"

RSpec.describe "entity/people/show", type: :view do
  before do
    @entity_person = assign(
      :entity_person,
      create(:entity_person, bio: "asd")
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@entity_person.firstname}/)
    expect(rendered).to match(/#{@entity_person.lastname}/)
    expect(rendered).to match(/#{@entity_person.bio}/)
  end
end
