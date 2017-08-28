class TagSerializer < ActiveModel::Serializer
  attributes :id, :label
  has_many :breeds
  attribute :relationships, if: :include_stats?
end
