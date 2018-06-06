require 'rails_helper'

RSpec.xdescribe "event/activity_postulations/index", type: :view do
  before(:each) do
    assign(:event_activity_postulations, [
      Event::Activity::Postulation.create!(),
      Event::Activity::Postulation.create!()
    ])
  end

  it "renders a list of event/activity_postulations" do
    render
  end
end
