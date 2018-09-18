# frozen_string_literal: true

require "rails_helper"

RSpec.describe "event/activities/edit", type: :view do
  before { skip("Not yet implemented") }

  before do
    @event_activity = assign(:event_activity, create(:event_activity))
  end

  it "renders the edit event_activity form" do
    render

    assert_select "form[action=?][method=?]", event_activity_path(@event_activity), "post" do
      assert_select "input[name=?]", "event_activity[type]"

      assert_select "input[name=?]", "event_activity[event_day_id]"

      assert_select "input[name=?]", "event_activity[title]"

      assert_select "textarea[name=?]", "event_activity[description]"
    end
  end
end
