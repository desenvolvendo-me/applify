class AddProfileToCandidatures < ActiveRecord::Migration[7.0]
  def change
    add_reference :candidatures, :profile, null: false, foreign_key: true
  end
end
