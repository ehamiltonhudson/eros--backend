class Api::V1::SunsController < ApplicationController

  def index
    @suns = Sun.all
    render json: @suns, status: 200
  end
  
  def show
    @sun = Sun.find(params[:id])
    render json: @sun, status: 200
  end

end
