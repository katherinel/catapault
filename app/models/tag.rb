class Tag < ApplicationRecord
  validates :label, presence: true, uniqueness: true
  has_many :assignments, as: :assignee
  has_many :breeds, through: :assignments, source: :assignable, source_type: 'Breed'
end
