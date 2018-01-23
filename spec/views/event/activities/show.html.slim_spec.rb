require "rails_helper"

RSpec.describe "event/activities/show", type: :view do
  before(:each) do
    @event_activity = assign(:event_activity, Event::Activity.create!(
                                                type: "Type",
                                                event_day: nil,
                                                title: "Title",
                                                description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
