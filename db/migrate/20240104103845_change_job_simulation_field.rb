class ChangeJobSimulationField < ActiveRecord::Migration[7.0]
  def change
    rename_column :job_simulations, :company, :name
  end
end
