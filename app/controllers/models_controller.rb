class ModelsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @query = params[:query]
      coordinates = Geocoder.search(params[:query]).first.coordinates
      # @models = Model.includes(:scooters).where("location ILIKE ?", "%#{@query}%").references(:scooters)
      available = Scooter.where(availability: true)
      scooters = available.near(coordinates, 100)
      model_ids = []
      scooters.each {|scooter| model_ids << scooter.model_id}
      @models = Model.where(id: model_ids)
      session[:coordinates] = coordinates
    else
      @models = Model.all
    end
  end

  def show
    @mapCenter = session[:coordinates] || [-8.6478175, 115.1385192]
    @model = Model.find(params[:id])
    @available = @model.scooters.where(availability: true)
    @scooters = @available.near(@mapCenter, 100)
    @markers = @scooters.map do |scooter|
      {
        lat: scooter.latitude,
        lng: scooter.longitude
      }
    end
  end
  session.delete(:coordinates) if session[:coordinates]
end
