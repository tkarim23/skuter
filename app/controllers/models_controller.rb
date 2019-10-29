class ModelsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
