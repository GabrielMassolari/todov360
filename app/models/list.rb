class List < ApplicationRecord
  validates :name, presence: true
  has_many :tasks, dependent: :restrict_with_error
  belongs_to :user
end
