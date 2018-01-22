require 'rails_helper'

RSpec.describe "event/activities/new", type: :view do
  before(:each) do
    assign(:event_activity, Event::Activity::Postulation.new(
      :event => nil,
      :postulant_firstname => "MyString",
      :postulant_lastname => "MyString",
      :postulant_email => "MyString",
      :postulant_phone_number => "MyString",
      :postulant_bio => "MyText",
      :activity_type => "MyString",
      :activity_title => "MyString",
      :activity_description => "MyText",
      :activity_estimated_duration => 1,
      :activity_difficulty_level => "MyString",
      :activity_preferred_time => "MyString"
    ))
  end

  it "renders new event_activity form" do
    render

    assert_select "form[action=?][method=?]", event_activity_postulations_path, "post" do

      assert_select "input[name=?]", "event_activity[event_id]"

      assert_select "input[name=?]", "event_activity[postulant_firstname]"

      assert_select "input[name=?]", "event_activity[postulant_lastname]"

      assert_select "input[name=?]", "event_activity[postulant_email]"

      assert_select "input[name=?]", "event_activity[postulant_phone_number]"

      assert_select "textarea[name=?]", "event_activity[postulant_bio]"

      assert_select "input[name=?]", "event_activity[activity_type]"

      assert_select "input[name=?]", "event_activity[activity_title]"

      assert_select "textarea[name=?]", "event_activity[activity_description]"

      assert_select "input[name=?]", "event_activity[activity_estimated_duration]"

      assert_select "input[name=?]", "event_activity[activity_difficulty_level]"

      assert_select "input[name=?]", "event_activity[activity_preferred_time]"
    end
  end
end
