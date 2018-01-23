require "rails_helper"

RSpec.describe Event::Activity::PostulationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/event/activities").to route_to("event/activities#index")
    end

    it "routes to #new" do
      expect(get: "/event/activities/new").to route_to("event/activities#new")
    end

    it "routes to #show" do
      expect(get: "/event/activities/1").to route_to("event/activities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/event/activities/1/edit").to route_to("event/activities#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/event/activities").to route_to("event/activities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/event/activities/1").to route_to("event/activities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/event/activities/1").to route_to("event/activities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/event/activities/1").to route_to("event/activities#destroy", id: "1")
    end

  end
end
