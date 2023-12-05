json.extract! candidature, :id, :company_name, :situation, :created_at, :updated_at
json.url candidature_url(candidature, format: :json)
