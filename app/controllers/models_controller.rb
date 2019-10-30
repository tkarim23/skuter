class ModelsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @models = Model.all
  end

  def show
    @model = Model.find(params[:id])
    @scooters = @model.scooters
    @geocoded = @model.scooters.geocoded
    @markers = @geocoded.map do |scooter|
      {
        lat: scooter.latitude,
        lng: scooter.longitude
      }
    end
  end

end
