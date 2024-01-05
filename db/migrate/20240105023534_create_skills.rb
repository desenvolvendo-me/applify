class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :description
      t.integer :skill_type

      t.timestamps
    end

    add_index :skills, :description, unique: true
  end
end
