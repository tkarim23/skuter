class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @user = @booking.user
    @review.user = @user
    if @review.save
      redirect_to user_dashboard_path
    else
      redirect_to booking_path(@booking)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
