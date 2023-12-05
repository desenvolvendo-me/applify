# == Schema Information
#
# Table name: stacks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Stack < ApplicationRecord
  belongs_to :manager_company, :class_name => 'Manager::Company'
end

