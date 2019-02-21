# frozen_string_literal: true

json.array! @venue_rooms, partial: "venue_rooms/venue_room", as: :venue_room
