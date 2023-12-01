class CreateManagerCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :manager_companies do |t|
      t.string :name
      t.string :description
      t.string :linkedin
      t.string :site

      t.timestamps
    end
  end
end
