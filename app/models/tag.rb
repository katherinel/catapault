class Tag < ApplicationRecord
  has_many :assignments, as: :assignee
  has_many :breeds, through: :assignments, source: :assignable, source_type: 'Breed'
end
