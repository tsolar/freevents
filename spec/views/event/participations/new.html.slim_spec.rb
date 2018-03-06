require "rails_helper"

RSpec.describe "event/participations/new", type: :view do
  before { skip("Not yet implemented") }
  before(:each) do
    assign(:event_participation, Event::Participation.new(
                                   event: nil,
                                   type: "",
                                   participant: nil,
                                   description: "MyText"
    ))
  end

  it "renders new event_participation form" do
    render

    assert_select "form[action=?][method=?]", event_participations_path, "post" do

      assert_select "input[name=?]", "event_participation[event_id]"

      assert_select "input[name=?]", "event_participation[type]"

      assert_select "input[name=?]", "event_participation[participant_id]"

      assert_select "textarea[name=?]", "event_participation[description]"
    end
  end
end
