class CreateJoinTableCompanyStack < ActiveRecord::Migration[7.0]
  def change
    create_join_table :companies, :stacks do |t|
      # t.index [:company_id, :stack_id]
      # t.index [:stack_id, :company_id]
    end
  end
end
