class ReviewsController < ApplicationController
  def new
  	puts params.inspect
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@review = Review.new
  end

  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@review = @restaurant.reviews.create(params[:review].permit(:thoughts, :rating))

  	# redirect_to '/restaurants'
  	# respond_to do |format|
  	# 	format.html{ redirect_to '/restaurants'}
  	# 	format.json{ render json: review}
  	# end

  	render 'create', content_type: :json
  end
end
