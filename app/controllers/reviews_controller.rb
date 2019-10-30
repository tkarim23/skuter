class ReviewsController < ApplicationController
  def new
    @reviews = Review.new
    @scooter = Scooter.find(params[:scooter_id])
  end

  def create
    @reviews = Review.new(review_params)
    @scooter = Scooter.find(params[:scooter_id])
    @review.scooter = @scooter
    if @review.save
      redirect_to scooter_path(@scooter)
    else
      render :new
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
