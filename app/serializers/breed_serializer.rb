class BreedSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tags, if: :show_relationships?
  attribute :relationships, if: :include_stats?

end