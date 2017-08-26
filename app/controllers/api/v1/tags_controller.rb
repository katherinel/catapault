class Api::V1::TagsController < Api::V1::ApiController
  before_action :set_tag, only: [:show, :update, :destroy]

  def index
    @tags = Tag.all
    render json: @tags
  end

  def show
    render json: @tag
  end

  private

  def set_tag
    begin
      @tag = Tag.find params[:id]
    rescue ActiveRecord::RecordNotFound
      tag = Tag.new
      tag.errors.add(:id, "Wrong ID provided")
      render_error(tag, 404) and return
    end
  end
end
