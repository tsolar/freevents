json.extract! event_activity, :id, :type, :event_day_id, :title, :description, :starts_at, :ends_at, :created_at, :updated_at
json.url event_activity_url(event_activity, format: :json)
