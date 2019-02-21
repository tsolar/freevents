# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Entity::People", type: :request do
  describe "GET /entity_people" do
    it "works! (now write some real specs)" do
      get entity_people_path
      expect(response).to have_http_status(200)
    end
  end
end
