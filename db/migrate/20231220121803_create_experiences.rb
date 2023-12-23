class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.integer :level, default: "0"

      t.timestamps
    end
  end
end
