class AddFieldsToCandidatures < ActiveRecord::Migration[7.0]
  def change
    add_column :candidatures, :job_position, :string
    add_column :candidatures, :job_description, :string
    add_column :candidatures, :location, :string
    add_column :candidatures, :contract_type, :string
    add_column :candidatures, :salary, :decimal
    add_column :candidatures, :benefits, :string
    add_column :candidatures, :contact_name, :string
    add_column :candidatures, :contact_phone_number, :string
    add_column :candidatures, :contact_email, :string
  end
end
