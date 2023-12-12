class AddFieldsToSimulationQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :simulation_questions, :answer_check, :boolean
    add_column :simulation_questions, :answer_text, :text
    add_column :simulation_questions, :answer_link, :string
    add_column :simulation_questions, :answer_type, :integer
  end
end
