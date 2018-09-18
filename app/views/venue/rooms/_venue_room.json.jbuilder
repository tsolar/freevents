# frozen_string_literal: true

json.extract! venue_room, :id, :venue_id, :name, :capacity, :created_at, :updated_at
json.url venue_room_url(venue_room, format: :json)
