class CreateInterviewQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :interview_questions do |t|
      t.references :interview_test, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
