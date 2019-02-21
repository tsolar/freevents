# frozen_string_literal: true

require "rails_helper"

RSpec.describe Entity::OrganizationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/entity/organizations").to route_to("entity/organizations#index")
    end

    it "routes to #new" do
      expect(get: "/entity/organizations/new").to route_to("entity/organizations#new")
    end

    it "routes to #show" do
      expect(get: "/entity/organizations/1").to route_to("entity/organizations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/entity/organizations/1/edit").to route_to("entity/organizations#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/entity/organizations").to route_to("entity/organizations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/entity/organizations/1").to route_to("entity/organizations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/entity/organizations/1").to route_to("entity/organizations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/entity/organizations/1").to route_to("entity/organizations#destroy", id: "1")
    end
  end
end
