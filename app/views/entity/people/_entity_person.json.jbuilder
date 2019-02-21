# frozen_string_literal: true

json.extract! entity_person, :id, :firstname, :lastname, :dob, :bio, :created_at, :updated_at
json.url entity_person_url(entity_person, format: :json)
