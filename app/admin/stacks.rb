ActiveAdmin.register Stack do
 permit_params :name, company_ids: []

 index do
   column :name
   column :companies do |c|
     c.companies.map(&:name).join(", ")
end
 end
end
