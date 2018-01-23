require "rails_helper"

RSpec.describe Entity::PeopleController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/entity/people").to route_to("entity/people#index")
    end

    it "routes to #new" do
      expect(get: "/entity/people/new").to route_to("entity/people#new")
    end

    it "routes to #show" do
      expect(get: "/entity/people/1").to route_to("entity/people#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/entity/people/1/edit").to route_to("entity/people#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/entity/people").to route_to("entity/people#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/entity/people/1").to route_to("entity/people#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/entity/people/1").to route_to("entity/people#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/entity/people/1").to route_to("entity/people#destroy", id: "1")
    end

  end
end
