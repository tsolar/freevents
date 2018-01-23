require "rails_helper"

RSpec.describe "event/activities/new", type: :view do
  before(:each) do
    assign(:event_activity, Event::Activity::Participation.new(
                              event_activity: nil,
                              event_participation: nil,
                              type: ""
    ))
  end

  it "renders new event_activity form" do
    render

    assert_select "form[action=?][method=?]", event_activity_participations_path, "post" do

      assert_select "input[name=?]", "event_activity[event_activity_id]"

      assert_select "input[name=?]", "event_activity[event_participation_id]"

      assert_select "input[name=?]", "event_activity[type]"
    end
  end
end
