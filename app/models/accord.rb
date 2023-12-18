# == Schema Information
#
# Table name: accords
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Accord < ApplicationRecord
end
