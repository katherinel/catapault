ActiveModel::Serializer.config.adapter = :json_api

class ActiveModel::Serializer
  def include_stats?
    @instance_options[:has_manys]
  end

  def stats
    @instance_options[:has_manys].map do |relationship|
      {
        "#{relationship.singularize}_ids".to_sym => @object.send(relationship).pluck(:id),
        "#{relationship.singularize}_count".to_sym => @object.send(relationship).count
      }
    end
  end
end