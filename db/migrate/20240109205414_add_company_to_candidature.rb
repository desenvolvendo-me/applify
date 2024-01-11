class AddCompanyToCandidature < ActiveRecord::Migration[7.0]
  def change
    add_reference :candidatures, :company, null: false, foreign_key: true
  end
end
