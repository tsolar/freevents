require "rails_helper"

RSpec.describe "Entity::Organizations", type: :request do
  describe "GET /entity_organizations" do
    it "works! (now write some real specs)" do
      get entity_organizations_path
      expect(response).to have_http_status(200)
    end
  end
end
