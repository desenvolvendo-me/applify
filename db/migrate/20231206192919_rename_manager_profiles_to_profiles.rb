class RenameManagerProfilesToProfiles < ActiveRecord::Migration[7.0]
  def change
    rename_table :manager_profiles, :profiles
  end
end
