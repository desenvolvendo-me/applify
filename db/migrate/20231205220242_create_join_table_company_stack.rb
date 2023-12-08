class CreateJoinTableCompanyStack < ActiveRecord::Migration[7.0]
  def change
    create_join_table :companies, :stacks do |t|
    end
  end
end
