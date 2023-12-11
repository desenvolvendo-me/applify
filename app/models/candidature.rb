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
  enum situation: { dispatch: 'dispatch', sending: 'sending',
                    answered: 'answered' }

  validates :company_name, presence: true

  def to_s
    company_name
  end
end
