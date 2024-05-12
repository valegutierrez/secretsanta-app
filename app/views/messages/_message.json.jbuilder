json.extract! message, :id, :question, :created_at, :updated_at
json.url message_url(message, format: :json)
