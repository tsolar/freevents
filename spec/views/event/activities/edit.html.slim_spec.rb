require "rails_helper"

RSpec.describe "event/activities/edit", type: :view do
  before(:each) do
    @event_activity = assign(:event_activity, Event::Activity.create!(
                                                type: "",
                                                event_day: nil,
                                                title: "MyString",
                                                description: "MyText"
    ))
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
