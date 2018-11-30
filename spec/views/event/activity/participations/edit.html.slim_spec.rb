# frozen_string_literal: true

require "rails_helper"

RSpec.describe "event/activities/edit", type: :view do
  before { skip("Not yet implemented") }

  before do
    @event_activity = assign(:event_activity, Event::Activity::Participation.create!(
                                                event_activity: nil,
                                                event_participation: nil,
                                                type: ""
                                              ))
  end

  it "renders the edit event_activity form" do
    render

    assert_select "form[action=?][method=?]", event_activity_path(@event_activity), "post" do
      assert_select "input[name=?]", "event_activity[event_activity_id]"

      assert_select "input[name=?]", "event_activity[event_participation_id]"

      assert_select "input[name=?]", "event_activity[type]"
    end
  end
end
