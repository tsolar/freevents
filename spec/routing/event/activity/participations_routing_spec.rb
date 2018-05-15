require "rails_helper"

RSpec.describe Event::Activity::ParticipationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/events/1/activities").to route_to("event/activities#index", event_id: "1")
    end

    it "routes to #new" do
      expect(get: "/events/1/activities/new").to route_to("event/activities#new", event_id: "1")
    end

    it "routes to #show" do
      expect(get: "/events/1/activities/1").to route_to("event/activities#show", id: "1", event_id: "1")
    end

    it "routes to #edit" do
      expect(get: "/events/1/activities/1/edit").to route_to("event/activities#edit", id: "1", event_id: "1")
    end

    it "routes to #create" do
      expect(post: "/events/1/activities").to route_to("event/activities#create", event_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/events/1/activities/1").to route_to("event/activities#update", id: "1", event_id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/events/1/activities/1").to route_to("event/activities#update", id: "1", event_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/events/1/activities/1").to route_to("event/activities#destroy", id: "1", event_id: "1")
    end

  end
end
