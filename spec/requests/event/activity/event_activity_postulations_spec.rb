require "rails_helper"

RSpec.describe "Event::Activity::Postulations", type: :request do
  let(:event_activity) { create(:event_activity) }

  describe "GET /event_activity_postulations" do
    it "works! (now write some real specs)" do
      get event_activity_postulations_path(event_id: event_activity.event_day.event.to_param, activity_id: event_activity.to_param)
      expect(response).to have_http_status(200)
    end
  end
end
