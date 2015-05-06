json.array!(@groups) do |group|
  json.extract! group, :id, :groupname, :description, :location, :user_id
  json.url group_url(group, format: :json)
end
