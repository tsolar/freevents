require "rails_helper"

RSpec.describe "events/index", type: :view do
  before(:each) do
    @events = assign(:events, FactoryBot.create_list(:event, 2))
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: @events.first.to_s, count: 1
    assert_select "tr>td", text: @events.second.to_s, count: 1
  end
end
