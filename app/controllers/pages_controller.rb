class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def user_dashboard
    @user = current_user
    @bookings = Booking.where(user:@user)
    @listings = Scooter.where(user: @user)
  end
end
