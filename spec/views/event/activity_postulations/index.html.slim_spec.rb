# frozen_string_literal: true

require "rails_helper"

RSpec.xdescribe "event/activity_postulations/index", type: :view do
  before do
    assign(:event_activity_postulations, [
             Event::Activity::Postulation.create!,
             Event::Activity::Postulation.create!
           ])
  end

  it "renders a list of event/activity_postulations" do
    render
  end
end
