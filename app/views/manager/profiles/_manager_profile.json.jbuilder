json.extract! manager_profile, :id, :user_id, :name, :user_type, :created_at, :updated_at
json.url manager_profile_url(manager_profile, format: :json)
