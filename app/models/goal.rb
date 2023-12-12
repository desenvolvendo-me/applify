# == Schema Information
#
# Table name: goals
#
#  id          :bigint           not null, primary key
#  description :string
#  finished_at :datetime
#  name        :string
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Goal < ApplicationRecord
  has_many :tasks, dependent: :destroy, inverse_of: :goal

  enum status: { backlog: 'backlog', todo: 'todo', block: 'block',
                 doing: 'doing', done: 'done' }

  validates :name, presence: true

  accepts_nested_attributes_for :tasks, allow_destroy: true,
                                        reject_if: :all_blank

  after_update :after_update

  def after_update
    GoalFinishedJob.perform_later(self)
  end

  def to_s
    name
  end
end
