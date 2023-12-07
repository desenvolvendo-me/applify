class CreateSimulationQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :simulation_questions do |t|
      t.references :job_simulation, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
