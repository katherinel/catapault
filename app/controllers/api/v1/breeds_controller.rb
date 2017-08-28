class Api::V1::BreedsController < Api::V1::ApiController
  before_action :set_breed, only: [:show, :update, :destroy]

  def index
    @breeds = Breed.all
    render json: @breeds, include: params[:include]
  end

  def create
    breed = Breed.new(breed_params)
    if breed.save
      render json: breed, status: :created
    else
      render_error(breed, :unprocessable_entity)
    end
  end

  def show
    render json: @breed, include: params[:include]
  end

  def update
    if @breed.update_attributes(breed_params)
      render json: @breed, status: :ok, include: params[:include]
    else
      render_error(@breed, :unprocessable_entity)
    end
  end

  def destroy
    @breed.destroy
    head 204
  end

  private

  def set_breed
    begin
      @breed = Breed.find params[:id]
    rescue ActiveRecord::RecordNotFound
      breed = Breed.new
      breed.errors.add(:id, "Wrong ID provided")
      render_error(breed, 404) and return
    end
  end

  def breed_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

end
