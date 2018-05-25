require 'rails_helper'

RSpec.xdescribe "event/activity_postulations/edit", type: :view do
  before(:each) do
    @event_activity_postulation = assign(:event_activity_postulation, Event::Activity::Postulation.create!())
  end

  it "renders the edit event_activity_postulation form" do
    render

    assert_select "form[action=?][method=?]", event_activity_postulation_path(@event_activity_postulation), "post" do
    end
  end
end
