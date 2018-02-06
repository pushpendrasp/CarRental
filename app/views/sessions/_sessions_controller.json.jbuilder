json.extract! sessions_controller, :id, :created_at, :updated_at
json.url sessions_controller_url(sessions_controller, format: :json)
