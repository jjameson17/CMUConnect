json.extract! message, :id, :send_id, :receive_id, :message_content, :create_date, :created_at, :updated_at
json.url message_url(message, format: :json)