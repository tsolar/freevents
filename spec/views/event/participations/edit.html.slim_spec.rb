require "rails_helper"

RSpec.describe "event/participations/edit", type: :view do
  before(:each) do
    @event_participation = assign(:event_participation, Event::Participation.create!(
                                                          event: nil,
                                                          type: "",
                                                          participant: nil,
                                                          description: "MyText"
    ))
  end

  it "renders the edit event_participation form" do
    render

    assert_select "form[action=?][method=?]", event_participation_path(@event_participation), "post" do

      assert_select "input[name=?]", "event_participation[event_id]"

      assert_select "input[name=?]", "event_participation[type]"

      assert_select "input[name=?]", "event_participation[participant_id]"

      assert_select "textarea[name=?]", "event_participation[description]"
    end
  end
end
