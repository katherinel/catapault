class TagSerializer < ActiveModel::Serializer
  attributes :id, :label
  attribute :relationships, if: :include_stats?
end
