require "rails_helper"

RSpec.describe "Event::Participations", type: :request do
  describe "GET /event_participations" do
    it "works! (now write some real specs)" do
      get event_participations_path
      expect(response).to have_http_status(200)
    end
  end
end
