class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :description, unique: true
      t.integer :type_skill

      t.timestamps
    end
  end
end
