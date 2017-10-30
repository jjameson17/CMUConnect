json.extract! post_thread, :id, :subject, :create_date, :created_at, :updated_at
json.url post_thread_url(post_thread, format: :json)