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
  pending "add some examples to (or delete) #{__FILE__}"
end
