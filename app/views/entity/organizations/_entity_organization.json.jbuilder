# frozen_string_literal: true

json.extract! entity_organization, :id, :type, :name, :created_at, :updated_at
json.url entity_organization_url(entity_organization, format: :json)
