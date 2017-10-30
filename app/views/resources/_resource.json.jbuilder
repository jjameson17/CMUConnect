json.extract! resource, :id, :resource_type, :resource_name, :user_id, :created_at, :updated_at
json.url resource_url(resource, format: :json)