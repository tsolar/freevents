json.extract! event_activity_participation, :id, :event_activity_id, :event_participation_id, :type, :created_at, :updated_at
json.url event_activity_participation_url(event_activity_participation, format: :json)
