# frozen_string_literal: true

require "rails_helper"

RSpec.xdescribe "event/activity_postulations/new", type: :view do
  before do
    assign(:event_activity_postulation, Event::Activity::Postulation.new)
  end

  it "renders new event_activity_postulation form" do
    render

    assert_select "form[action=?][method=?]", event_activity_postulations_path, "post" do
    end
  end
end
