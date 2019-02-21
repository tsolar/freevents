# frozen_string_literal: true

require "rails_helper"

RSpec.describe Venue::RoomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/venue/rooms").to route_to("venue/rooms#index")
    end

    it "routes to #new" do
      expect(get: "/venue/rooms/new").to route_to("venue/rooms#new")
    end

    it "routes to #show" do
      expect(get: "/venue/rooms/1").to route_to("venue/rooms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/venue/rooms/1/edit").to route_to("venue/rooms#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/venue/rooms").to route_to("venue/rooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/venue/rooms/1").to route_to("venue/rooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/venue/rooms/1").to route_to("venue/rooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/venue/rooms/1").to route_to("venue/rooms#destroy", id: "1")
    end
  end
end
