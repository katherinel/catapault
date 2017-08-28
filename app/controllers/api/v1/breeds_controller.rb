class Api::V1::BreedsController < Api::V1::ApiController
  before_action :set_breed, only: [:show, :update, :destroy]

  def index
    @breeds = Breed.all
    render json: @breeds, include: params[:include]
  end

  # def create
  #   breeds = breeds_params.map{|b| Breed.new(b)}
  #   invalid = breeds.reject(&:valid?).first
  #   if invalid
  #     render_error(invalid, :unprocessable_entity)
  #   else
  #     breeds.each(&:save)
  #     render json: breeds, include: params[:include]
  #   end
  # end

  def create
    breed = Breed.new(breed_params)
    debugger
    if breed.save
      render json: breed, status: :created
    else
      render_error(breed, :unprocessable_entity)
    end
  end

  def show
    # render json: @breed, show_relationships: true
    render json: @breed, include: params[:include]
  end

  def update
    if @breed.update_attributes(breed_params)
      render json: @breed, status: :ok, include: params[:include]
    else
      render_error(@breed, :unprocessable_entity)
    end
  end

  # def update
  #   if breed_params.keys.include?("tags")
  #     # allow either an array of strings or hashes to be passed in
  #     if breed_params["tags"].map(&:class).compact.first == String
  #       tag_params = breed_params["tags"].map{|t| {label: t} }
  #     else 
  #       tag_params = breed_params["tags"]
  #     end
  #   end
  #   # find or initialize the tags
  #   tags = tag_params.map{ |tp| Tag.find_by(tp) || Tag.new(tp) }
  #   if @breed.update_attributes( breed_params.except(:tags).merge(tags: tags) )
  #     # render json: @breed, status: :ok, show_relationships: true
  #     render json: @breed, status: :ok, include: params[:include]
  #   else
  #     render_error(@breed, :unprocessable_entity)
  #   end
  # end

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

  # def breed_params
  #   params.permit(:name, tags:[])
  # end

  # def breeds_params
  #   params.permit(breeds: [:name]).require(:breeds)
  # end

  def breed_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

end
