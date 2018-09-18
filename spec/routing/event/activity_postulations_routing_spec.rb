# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::ActivityPostulationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/events/1/activities/postulations").to route_to("event/activity_postulations#index", event_id: "1")
    end

    it "routes to #new" do
      expect(get: "/events/1/activities/postulations/new").to route_to("event/activity_postulations#new", event_id: "1")
    end

    it "routes to #show" do
      expect(get: "/events/1/activities/postulations/1").to route_to("event/activity_postulations#show", id: "1", event_id: "1")
    end

    it "routes to #edit" do
      expect(get: "/events/1/activities/postulations/1/edit").to route_to("event/activity_postulations#edit", id: "1", event_id: "1")
    end

    it "routes to #create" do
      expect(post: "/events/1/activities/postulations").to route_to("event/activity_postulations#create", event_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/events/1/activities/postulations/1").to route_to("event/activity_postulations#update", id: "1", event_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/events/1/activities/postulations/1").to route_to("event/activity_postulations#update", id: "1", event_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/events/1/activities/postulations/1").to route_to("event/activity_postulations#destroy", id: "1", event_id: "1")
    end
  end
end
