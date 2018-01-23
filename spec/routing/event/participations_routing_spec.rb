require "rails_helper"

RSpec.describe Event::ParticipationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/event/participations").to route_to("event/participations#index")
    end

    it "routes to #new" do
      expect(get: "/event/participations/new").to route_to("event/participations#new")
    end

    it "routes to #show" do
      expect(get: "/event/participations/1").to route_to("event/participations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/event/participations/1/edit").to route_to("event/participations#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/event/participations").to route_to("event/participations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/event/participations/1").to route_to("event/participations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/event/participations/1").to route_to("event/participations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/event/participations/1").to route_to("event/participations#destroy", id: "1")
    end

  end
end
