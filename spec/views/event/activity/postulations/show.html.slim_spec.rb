require "rails_helper"

RSpec.describe "event/activities/show", type: :view do
  before(:each) do
    @event_activity = assign(:event_activity, Event::Activity::Postulation.create!(
                                                event: nil,
                                                postulant_firstname: "Postulant Firstname",
                                                postulant_lastname: "Postulant Lastname",
                                                postulant_email: "Postulant Email",
                                                postulant_phone_number: "Postulant Phone Number",
                                                postulant_bio: "MyText",
                                                activity_type: "Activity Type",
                                                activity_title: "Activity Title",
                                                activity_description: "MyText",
                                                activity_estimated_duration: 2,
                                                activity_difficulty_level: "Activity Difficulty Level",
                                                activity_preferred_time: "Activity Preferred Time"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Postulant Firstname/)
    expect(rendered).to match(/Postulant Lastname/)
    expect(rendered).to match(/Postulant Email/)
    expect(rendered).to match(/Postulant Phone Number/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Activity Type/)
    expect(rendered).to match(/Activity Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Activity Difficulty Level/)
    expect(rendered).to match(/Activity Preferred Time/)
  end
end
