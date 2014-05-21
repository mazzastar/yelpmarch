class ReviewsController < ApplicationController
  def new
  	puts params.inspect
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@review = Review.new
  end

  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	puts params[:review].inspect
  	@restaurant.reviews.create(params[:review].permit(:thoughts, :rating))

  	redirect_to '/restaurants'
  end
end
