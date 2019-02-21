# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Venue::Rooms", type: :request do
  describe "GET /venue_rooms" do
    it "works! (now write some real specs)" do
      get venue_rooms_path
      expect(response).to have_http_status(200)
    end
  end
end
