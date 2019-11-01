class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def create
    @booking = Booking.new
    start_date = Date.parse(params[:booking][:start_date].split(' ')[0])
    end_date = Date.parse(params[:booking][:start_date].split(' ')[2])
    @booking.start_date = start_date
    @booking.end_date = end_date
    @booking.user = current_user
    @booking.scooter_id = params[:scooter_id]
    @booking.price = ((@booking.end_date - @booking.start_date).to_i) * @booking.scooter.price_per_day
    @booking.save
      redirect_to user_dashboard_path
  end

  def show
    @scooter = @booking.scooter
    @review = Review.new
  end

  def edit
  end

  def update
     @booking.update(booking_params)
    redirect_to action: "show"
  end

  def destroy
    @booking.destroy
    redirect_to user_dashboard_path
  end

  def confirm_booking
    @booking = Booking.find(params[:booking_id])
    @booking.confirmed = true
    if @booking.save
      respond_to do |format|
        format.html { redirect_to user_dashboard_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'pages/user_dashboard'}
        format.js
      end
    end
  end

   private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date)
  end

end
