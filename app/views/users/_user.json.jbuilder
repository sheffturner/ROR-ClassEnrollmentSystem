json.extract! user, :id, :first_name, :last_name, :email, :major, :created_at, :updated_at, :year
json.url user_url(user, format: :json)