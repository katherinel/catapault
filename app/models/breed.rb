class Breed < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, allow_blank: false
  has_many :assignments, as: :assignable, dependent: :destroy
  has_many :tags, through: :assignments, source: :assignee, source_type: 'Tag'
end
