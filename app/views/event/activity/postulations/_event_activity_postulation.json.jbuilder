# frozen_string_literal: true

json.extract! event_activity_postulation, :id, :event_id, :postulant_firstname, :postulant_lastname, :postulant_email, :postulant_phone_number, :postulant_bio, :activity_type, :activity_title, :activity_description, :activity_estimated_duration, :activity_difficulty_level, :activity_preferred_time, :created_at, :updated_at
json.url event_activity_postulation_url(event_activity_postulation, format: :json)
