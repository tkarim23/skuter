class ScootersController < ApplicationController
  before_action :set_scooter, only: [:show, :edit, :update, :destroy]

  def new
    @scooter = Scooter.new
  end

  def create
    @scooter = Scooter.new(scooter_params)
    @scooter.user = current_user
    @scooter.save
    if @scooter.save
      redirect_to scooter_path(@scooter)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @reviews = @scooter.reviews
  end

  def edit
  end

  def update
    @scooter.update(scooter_params)
    redirect_to action: "show"
  end

  def destroy
    @scooter.destroy
    #redirect_to ???
  end

  private

  def set_scooter
    @scooter = Scooter.find(params[:id])
  end

  def scooter_params
    params.require(:scooter).permit(:model_id, :location, :age, :mileage, :condition, :photo, :colour, :price_per_day)
  end
end

