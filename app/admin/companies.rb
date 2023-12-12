ActiveAdmin.register Company do
  permit_params :name, :description, :linkedin, :site, stack_ids: []

  index do
    column :name
    column :description
    column :linkedin
    column :site
    column :stack do |s|
      s.stacks.map(&:name).join(', ')
    end

  end
end
