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
require 'rails_helper'

RSpec.describe Candidature, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:company_name) }
  end
end
