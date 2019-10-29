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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
