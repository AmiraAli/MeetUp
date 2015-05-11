json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :startdate, :enddate, :city, :country, :address, :user_id
  json.url event_url(event, format: :json)
end
