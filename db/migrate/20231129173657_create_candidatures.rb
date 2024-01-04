class CreateCandidatures < ActiveRecord::Migration[7.0]
  def change
    create_table :candidatures do |t|
      t.string :company_name
      t.string :situation

      t.timestamps
    end
  end
end
