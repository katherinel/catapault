# Borrowed from: https://sonjapeterson.github.io/2016/03/19/testing-serializers.html
module SerializerSpecHelper
  def serialize(obj, opts={})
    serializer_class = opts.delete(:serializer_class) || "#{obj.class.name}Serializer".constantize
    serializer = serializer_class.send(:new, obj)
    adapter = ActiveModel::Serializer::Adapter.create(serializer, opts)
    adapter.to_json
  end
end