class CreateInterviewTests < ActiveRecord::Migration[7.0]
  def change
    create_table :interview_tests do |t|
      t.string :company

      t.timestamps
    end
  end
end
