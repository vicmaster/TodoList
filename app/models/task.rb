class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :list_id
  belongs_to :list
  validates :description, presence: :true
  scope :completed, where(completed: true)
  scope :incompleted, where(completed: false)
end
