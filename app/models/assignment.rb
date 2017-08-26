class Assignment < ApplicationRecord
  validates_uniqueness_of :assignee_id, scope: [:assignee_type, :assignable_id, :assignable_type]
  belongs_to :assignee, polymorphic: true
  belongs_to :assignable, polymorphic: true
  validates_presence_of :assignee, :assignable
end
