require 'rails_helper'

RSpec.describe "event/participations/index", type: :view do
  before(:each) do
    assign(:event_participations, [
      Event::Participation.create!(
        :event => nil,
        :type => "Type",
        :participant => nil,
        :description => "MyText"
      ),
      Event::Participation.create!(
        :event => nil,
        :type => "Type",
        :participant => nil,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of event/participations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
