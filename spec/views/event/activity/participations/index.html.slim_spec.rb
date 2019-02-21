# frozen_string_literal: true

require "rails_helper"

RSpec.describe "event/activities/index", type: :view do
  before { skip("Not yet implemented") }

  before do
    assign(:event_activity_participations, [
             Event::Activity::Participation.create!(
               event_activity: nil,
               event_participation: nil,
               type: "Type"
             ),
             Event::Activity::Participation.create!(
               event_activity: nil,
               event_participation: nil,
               type: "Type"
             )
           ])
  end

  it "renders a list of event/activities" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
  end
end
