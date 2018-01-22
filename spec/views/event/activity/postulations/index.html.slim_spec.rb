require 'rails_helper'

RSpec.describe "event/activities/index", type: :view do
  before(:each) do
    assign(:event_activity_postulations, [
      Event::Activity::Postulation.create!(
        :event => nil,
        :postulant_firstname => "Postulant Firstname",
        :postulant_lastname => "Postulant Lastname",
        :postulant_email => "Postulant Email",
        :postulant_phone_number => "Postulant Phone Number",
        :postulant_bio => "MyText",
        :activity_type => "Activity Type",
        :activity_title => "Activity Title",
        :activity_description => "MyText",
        :activity_estimated_duration => 2,
        :activity_difficulty_level => "Activity Difficulty Level",
        :activity_preferred_time => "Activity Preferred Time"
      ),
      Event::Activity::Postulation.create!(
        :event => nil,
        :postulant_firstname => "Postulant Firstname",
        :postulant_lastname => "Postulant Lastname",
        :postulant_email => "Postulant Email",
        :postulant_phone_number => "Postulant Phone Number",
        :postulant_bio => "MyText",
        :activity_type => "Activity Type",
        :activity_title => "Activity Title",
        :activity_description => "MyText",
        :activity_estimated_duration => 2,
        :activity_difficulty_level => "Activity Difficulty Level",
        :activity_preferred_time => "Activity Preferred Time"
      )
    ])
  end

  it "renders a list of event/activities" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Postulant Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Postulant Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Postulant Email".to_s, :count => 2
    assert_select "tr>td", :text => "Postulant Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Activity Type".to_s, :count => 2
    assert_select "tr>td", :text => "Activity Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Activity Difficulty Level".to_s, :count => 2
    assert_select "tr>td", :text => "Activity Preferred Time".to_s, :count => 2
  end
end
