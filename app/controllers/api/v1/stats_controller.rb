class Api::V1::StatsController < ApplicationController
  before_action :set_resource_model

  def index
    # The resources we're pointing to: /:resources/stats
    resources = @resource_model.all
    # Figure out what the relationships are. We don't care about assignments; they're just a pass-through.
    has_manys = @resource_model.reflections.keys.reject{|k| k == "assignments"}
    model_serializer = "#{@resource_model.to_s}Serializer".constantize
    render json: resources, has_manys: has_manys, status: :ok, each_serializer: model_serializer
  end


  private
  def set_resource_model
    @resource_model = params[:resource].constantize
  end
end