require "rails_helper"

RSpec.describe Event::ActivityPostulationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event/activity_postulations").to route_to("event/activity_postulations#index")
    end

    it "routes to #new" do
      expect(:get => "/event/activity_postulations/new").to route_to("event/activity_postulations#new")
    end

    it "routes to #show" do
      expect(:get => "/event/activity_postulations/1").to route_to("event/activity_postulations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event/activity_postulations/1/edit").to route_to("event/activity_postulations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event/activity_postulations").to route_to("event/activity_postulations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event/activity_postulations/1").to route_to("event/activity_postulations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event/activity_postulations/1").to route_to("event/activity_postulations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event/activity_postulations/1").to route_to("event/activity_postulations#destroy", :id => "1")
    end

  end
end
