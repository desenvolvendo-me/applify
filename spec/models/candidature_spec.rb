# == Schema Information
#
# Table name: candidatures
#
#  id                      :bigint           not null, primary key
#  application_date        :date
#  company_name            :string
#  frame_work              :integer
#  job_description         :text
#  job_position            :string
#  knowledge_about_company :text
#  personal_projects       :string
#  presentation_letter     :text
#  programming_language    :integer
#  situation               :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  company_id              :bigint           not null
#  profile_id              :bigint           not null
#
# Indexes
#
#  index_candidatures_on_company_id  (company_id)
#  index_candidatures_on_profile_id  (profile_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (profile_id => profiles.id)
#
require 'rails_helper'

RSpec.describe Candidature, type: :model do
  describe 'association' do
    it { should belong_to(:profile) }
    it { should belong_to(:company) }
  end
end
