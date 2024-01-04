class AddStatusToJobSimulation < ActiveRecord::Migration[7.0]
  def change
    add_column :job_simulations, :status, :integer
  end
end
