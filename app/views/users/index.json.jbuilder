json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password, :isadmin, :gender, :age, :country, :city
  json.url user_url(user, format: :json)
end
