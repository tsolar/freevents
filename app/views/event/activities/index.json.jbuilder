# frozen_string_literal: true

json.array! @event_activities, partial: "event_activities/event_activity", as: :event_activity
