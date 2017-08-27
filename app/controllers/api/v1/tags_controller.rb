class Api::V1::TagsController < Api::V1::ApiController
  before_action :set_tag, only: [:show, :update, :destroy]

  def index
    @tags = Tag.all
    render json: @tags
  end


  def show
    render json: @tag
  end

  def update
    if @tag.update_attributes(tag_params) 
      render json: @tag, status: :ok
    else
      render_error(@tag, :unprocessable_entity)
    end
  end

  def destroy
    @tag.destroy
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

  def tag_params
    params.require(:tag).permit(:label)
  end
end
