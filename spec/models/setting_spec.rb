# == Schema Information
#
# Table name: settings
#
#  id         :bigint           not null, primary key
#  accord     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Setting, type: :model do
end
