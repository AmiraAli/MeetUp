json.array!(@posts) do |post|
  json.extract! post, :id, :body, :event_id, :user_id
  json.url post_url(post, format: :json)
end
