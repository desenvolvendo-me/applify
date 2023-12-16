class CreateProfileSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_skills do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
