require 'rails_helper'

RSpec.xdescribe "event/activity_postulations/show", type: :view do
  before(:each) do
    @event_activity_postulation = assign(:event_activity_postulation, Event::Activity::Postulation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
