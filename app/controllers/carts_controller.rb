class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]

  # GET /carts
  def index
    @carts = Cart.all

    render json: @carts
  end

  # GET /carts/1
  def show
    render json: @cart.baggages
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render json: @cart, status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  def rental
    @baggages = Cart.find(params[:cart_id]).baggages.where(rental_enabled: true)
    user = User.find(params[:user_id])
    if @baggages.empty?
      raise :errors
    else
      total_points = @baggages.where(rental_enabled: true).inject(0){|t, b| t + b.points}
      if total_points <= user.points
        user.transaction do
          user.update!(points: user.points - total_points)
          @baggages.map do |baggage|
            b_user = baggage.user
            b_user.transaction do
              b_user.update!(points: b_user.points + baggage.points*0.5.to_i)
              Baggage.transaction do
                baggage.update!(rental_user_id: user.id, rental_enabled: false)
              end
            end
          end
        end
        render json: @baggages
      else
        raise :errors
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.fetch(:cart, {})
    end
end
