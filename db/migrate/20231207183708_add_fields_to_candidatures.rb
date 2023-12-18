class AddFieldsToCandidatures < ActiveRecord::Migration[7.0]
  def change
    add_column :candidatures, :job_position, :string
    add_column :candidatures, :job_description, :text
    add_column :candidatures, :frame_work, :integer
    add_column :candidatures, :programming_language, :integer
    add_column :candidatures, :application_date, :date
    add_column :candidatures, :presentation_letter, :text
    add_column :candidatures, :knowledge_about_company, :text
    add_column :candidatures, :personal_projects, :string
  end
end
