require 'rails_helper'

RSpec.describe "Event::Activity::Postulations", type: :request do
  describe "GET /event_activity_postulations" do
    it "works! (now write some real specs)" do
      get event_activity_postulations_path
      expect(response).to have_http_status(200)
    end
  end
end
