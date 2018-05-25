require 'rails_helper'

RSpec.describe "Event::Activity::Postulations", type: :request do
  xdescribe "GET /event_activity_postulations" do
    it "works! (now write some real specs)" do
      event = FactoryBot.create(:event)
      get event_activities_postulations_path(event_id: event.to_param)
      expect(response).to have_http_status(200)
    end
  end
end
