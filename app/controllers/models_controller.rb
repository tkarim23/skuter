class ModelsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @query = params[:query]
      coordinates = Geocoder.search(params[:query]).first.coordinates
      # @models = Model.includes(:scooters).where("location ILIKE ?", "%#{@query}%").references(:scooters)
      scooters = Scooter.near(coordinates, 100)
      model_ids = []
      scooters.each {|scooter| model_ids << scooter.model_id}
      @models = Model.where(id: model_ids)
      session[:coordinates] = coordinates
    else
      @models = Model.all
    end
  end

  def show
    @mapCenter = session[:coordinates]
    @model = Model.find(params[:id])
    @scooters = @model.scooters.near(@mapCenter, 100)
    @markers = @scooters.map do |scooter|
      {
        lat: scooter.latitude,
        lng: scooter.longitude
      }
    end
  end
  session.delete(:coordinates)
end
