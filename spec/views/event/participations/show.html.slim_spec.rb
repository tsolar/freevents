# frozen_string_literal: true

require "rails_helper"

RSpec.describe "event/participations/show", type: :view do
  before { skip("Not yet implemented") }
  before do
    @event_participation = assign(:event_participation, Event::Participation.create!(
                                                          event: nil,
                                                          type: "Type",
                                                          participant: nil,
                                                          description: "MyText"
                                                        ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
