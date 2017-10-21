  class BaggagesController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:create]
    before_action :set_baggage, only: [:show, :update, :destroy]

    # GET /baggages
    def index
      @baggages = Baggage.all

      render json: @baggages
    end

    # GET /baggages/1
    def show
      render json: @baggage
    end

    # POST /baggages
    def create
      @baggage = Baggage.new(baggage_params)
      if @baggage.save
        render json: @baggage, status: :created, location: @baggage
      else
        render json: @baggage.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /baggages/1
    def update
      if @baggage.update(baggage_params)
        render json: @baggage
      else
        render json: @baggage.errors, status: :unprocessable_entity
      end
    end

    # DELETE /baggages/1
    def destroy
      @baggage.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_baggage
        @baggage = Baggage.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def baggage_params
        params.require(:baggage).permit(:name, :user_id)
      end
  end
