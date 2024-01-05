# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  description :string
#  linkedin    :string
#  name        :string
#  site        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
  has_and_belongs_to_many :stacks
  has_many :candidatures, dependent: :restrict_with_exception

  validate :not_associate_to_candidature, on: :destroy

  private

  def not_associate_to_candidature
    return unless candidatures.exists?

    errors.add(:base, 'Não possível excluir uma empresa associada a uma candidatura.')
    throw :abort
  end
end
