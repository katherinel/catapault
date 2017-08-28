class BreedSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tags
  attribute :stats, if: :include_stats?

end