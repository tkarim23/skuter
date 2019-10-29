class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def user_dashboard
    @user = current_user
    @bookings = Booking.where(user: @user)
    @past = @bookings.find_all { |b| b.start_date < Date.today}.sort_by {|b| b.start_date}
    @upcoming = @bookings.find_all { |b| b.start_date > Date.today}.sort_by {|b| b.start_date}
    @owned_scooters = Scooter.where(user: @user)
    @income = Booking.where(scooter: @owned_scooters)
    @past_income = @income.find_all { |b| b.start_date < Date.today}.sort_by {|b| b.start_date}
    @future_income = @income.find_all { |b| b.start_date > Date.today}.sort_by {|b| b.start_date}
  end
end
