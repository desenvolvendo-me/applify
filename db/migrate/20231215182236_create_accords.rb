class CreateAccords < ActiveRecord::Migration[7.0]
  def change
    create_table :accords do |t|
      t.text :description

      t.timestamps
    end
  end
end
