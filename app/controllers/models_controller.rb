class ModelsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @models = Model.all
  end

  def show
    @model = Model.find(params[:id])
  end

end
