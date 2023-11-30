# == Schema Information
#
# Table name: candidatures
#
#  id           :bigint           not null, primary key
#  company_name :string
#  situation    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Candidature < ApplicationRecord
end
