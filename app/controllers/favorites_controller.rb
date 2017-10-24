class FavoritesController < ApplicationController

  # GET /favorites
  def index
    @favorites = Favorite.all

    render json: @favorites
  end

  # GET /favorites/1
  def show
    render json: @favorite
  end

  # POST /favorites
  def create
    @favorite = Favorite.new(favorite_params)

    if @favorite.save
      render json: @favorite, status: :created, location: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorites/1
  def update
    if @favorite.update(favorite_params)
      render json: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorites/1
  def destroy
    @favorite.destroy
  end

  # GET /users/:user_id/favorites/:favorite_id/baggages
  def baggages
    @baggages = Favorite.find(User.find(params[:user_id]).favorite.id).baggages
    render json: @baggages
  end

  def add_favorite
    @favorite_baggage = FavoriteBaggage.new(favorite_id: User.find(params[:user_id]).favorite.id, baggage_id: params[:baggage_id])
    if !User.find(params[:user_id]).favorite.baggages.ids.include?(params[:baggage_id].to_i)
      if @favorite_baggage.save
        render json: Favorite.find_by(user_id: params[:user_id]).baggages
      else
        raise :errors
      end
    else
      render json: Favorite.find_by(user_id: params[:user_id]).baggages
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorite_params
      params.fetch(:favorite, {})
    end
end
