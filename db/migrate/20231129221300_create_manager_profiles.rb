class CreateManagerProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :manager_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :user_type

      t.timestamps
    end
  end
end
