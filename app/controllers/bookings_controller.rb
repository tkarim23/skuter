class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_create :check_availability

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      #redirect to
    else
      render :new
  end

  def show
  end

  def edit
  end

  def update
     @booking.update(booking_params)
    redirect_to action: "show"
  end

  def destroy
  end

   private



def self.check_availability(booking_params)
  bookings = Booking.where('start_date < ? OR end_date > ?', self.start_date, self.end_date)
  return bookings.empty?
end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :scooter_id, :start_date, :end_date)
  end

end
