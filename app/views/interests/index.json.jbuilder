json.array!(@interests) do |interest|
  json.extract! interest, :id, :interestname, :user_id
  json.url interest_url(interest, format: :json)
end
