require 'rails_helper'

RSpec.describe "event/activities/index", type: :view do
  before(:each) do
    assign(:event_activities, [
      Event::Activity.create!(
        :type => "Type",
        :event_day => nil,
        :title => "Title",
        :description => "MyText"
      ),
      Event::Activity.create!(
        :type => "Type",
        :event_day => nil,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of event/activities" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
