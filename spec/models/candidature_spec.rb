require 'rails_helper'

RSpec.describe Candidature, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:company_name) }
  end
end
