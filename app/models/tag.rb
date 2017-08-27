class Tag < ApplicationRecord
  validates :label, presence: true, uniqueness: { case_sensitive: false }, allow_blank: false
  has_many :assignments, as: :assignee, dependent: :destroy
  has_many :breeds, through: :assignments, source: :assignable, source_type: 'Breed'
end
