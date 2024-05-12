json.extract! event, :id, :title, :description, :members, :price_start, :price_end, :deadline, :admin_id, :created_at, :updated_at
json.url event_url(event, format: :json)
