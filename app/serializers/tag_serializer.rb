class TagSerializer < ActiveModel::Serializer
  attributes :id, :label
  has_many :breeds
  attribute :stats, if: :include_stats?
end
