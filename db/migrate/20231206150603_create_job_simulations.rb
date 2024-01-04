class CreateJobSimulations < ActiveRecord::Migration[7.0]
  def change
    create_table :job_simulations do |t|
      t.string :company

      t.timestamps
    end
  end
end
