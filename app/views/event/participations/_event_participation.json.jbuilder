# frozen_string_literal: true

json.extract! event_participation, :id, :event_id, :type, :participant_id, :participant_type, :description, :created_at, :updated_at
json.url event_participation_url(event_participation, format: :json)
