# frozen_string_literal: true

require "rails_helper"

RSpec.describe "events/edit", type: :view do
  before do
    @event = assign(:event, create(:event))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input[name=?]", "event[title]"

      assert_select "textarea[name=?]", "event[description]"
    end
  end
end
