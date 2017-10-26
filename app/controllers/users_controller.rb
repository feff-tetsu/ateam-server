  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:create]

    def index
      render json: User.all, each_serializer: UserSerializer
    end

    def show
      render json: User.find(params[:id]), each_serializer: UserSerializer
    end

    # POST
    # Create an user
    def create
      @user = User.new user_params

      if @user.save!
        RentalUser.create!(user_id: @user.id)
        Favorite.create!(user_id: @user.id)
        Cart.create!(user_id: @user.id)
        render json: @user, serializer: SessionSerializer, root: nil
      else
        render json: { error: t('user_create_error') }, status: :unprocessable_entity
      end
    end

    def get_point
      g_point = params.require(:point)
      @user = User.find(params[:user_id])
      @user.update!(points: @user.points + g_point)
      render json: @user
    end

    def rental_baggages
      @baggages = Baggage.where(rental_user_id: params[:user_id])
      render json: @baggages
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :points)
    end
  end
