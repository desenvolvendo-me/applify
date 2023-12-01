# == Schema Information
#
# Table name: manager_companies
#
#  id          :bigint           not null, primary key
#  description :string
#  linkedin    :string
#  name        :string
#  site        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
module Manager
  class Company < ApplicationRecord
    has_many :stack
  end
end
