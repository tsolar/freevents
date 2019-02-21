# frozen_string_literal: true

json.extract! event_activity_postulation, :id, :created_at, :updated_at
json.url event_activity_postulation_url(event_activity_postulation, format: :json)
