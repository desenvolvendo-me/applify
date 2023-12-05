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
  enum :situation,  send: 0, sending: 1, answered: 2

  # def self.humanized_situation(situation)
  #   I18n.t("simple_form.options.candidature.situation_#{situation}",
  #          default: situation.to_s)
  # end
end
