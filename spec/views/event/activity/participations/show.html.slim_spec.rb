require "rails_helper"

RSpec.describe "event/activities/show", type: :view do
  before { skip("Not yet implemented") }
  before(:each) do
    @event_activity = assign(:event_activity, Event::Activity::Participation.create!(
                                                event_activity: nil,
                                                event_participation: nil,
                                                type: "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
  end
end
