# frozen_string_literal: true

json.extract! venue, :id, :name, :description, :address, :lat, :lng, :created_at, :updated_at
json.url venue_url(venue, format: :json)
