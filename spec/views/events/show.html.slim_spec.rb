require "rails_helper"

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, FactoryBot.create(:event))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@event.title}/)
    expect(rendered).to match(/#{@event.description}/)
  end
end
