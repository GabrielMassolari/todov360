class Task < ApplicationRecord
  validates :status, inclusion: { in: %w(todo progress done), message: '%{value} is not a valid status' }
  validates :priority, inclusion: { in: %w(high medium low), message: '%{value} is not a valid priority' }
  validates :description, length: { maximum: 200 }

  belongs_to :list
  belongs_to :user
end
