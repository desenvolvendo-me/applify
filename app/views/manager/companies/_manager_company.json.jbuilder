json.extract! manager_company, :id, :name, :description, :linkedin, :site,
              :created_at, :updated_at
json.url manager_company_url(manager_company, format: :json)
