class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(safe_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity, notice: "Review was not successfully created."
    end
  end

  private

  def safe_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
