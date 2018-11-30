# frozen_string_literal: true

require "rails_helper"

RSpec.describe "event/activities/new", type: :view do
  before { skip("Not yet implemented") }

  before do
    assign(:event_activity, Event::Activity.new(
                              type: "",
                              event_day: nil,
                              title: "MyString",
                              description: "MyText"
                            ))
  end

  it "renders new event_activity form" do
    render

    assert_select "form[action=?][method=?]", event_activities_path, "post" do
      assert_select "input[name=?]", "event_activity[type]"

      assert_select "input[name=?]", "event_activity[event_day_id]"

      assert_select "input[name=?]", "event_activity[title]"

      assert_select "textarea[name=?]", "event_activity[description]"
    end
  end
end
