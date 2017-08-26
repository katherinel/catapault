class Breed < ApplicationRecord
  has_many :assignments, as: :assignable
  has_many :tags, through: :assignments, source: :assignee, source_type: 'Tag'
end
