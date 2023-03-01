class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(safe_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity, notice: "Restaurant was not successfully created."
    end
  end

  private

  def safe_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :reviews)
  end
end
