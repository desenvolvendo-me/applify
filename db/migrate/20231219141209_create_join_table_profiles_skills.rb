class CreateJoinTableProfilesSkills < ActiveRecord::Migration[7.0]
  def change
    create_join_table :profiles, :skills do |t|
    end
  end
end
