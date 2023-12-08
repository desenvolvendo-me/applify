# == Schema Information
#
# Table name: candidatures
#
#  id                   :bigint           not null, primary key
#  benefits             :text
#  company_name         :string
#  contact_email        :string
#  contact_name         :string
#  contact_phone_number :string
#  contract_type        :string
#  job_description      :text
#  job_position         :string
#  location             :string
#  salary               :decimal(, )
#  situation            :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Candidature < ApplicationRecord
  enum situation: { dispatch: 'dispatch', sending: 'sending',
                    answered: 'answered' }
end
