class Api::V1::SunsController < ApplicationController

  def index
    @suns = Sun.all
    # @compatible_suns = Sun.compatible_suns
    render json: @suns, status: 200
  end

  def

  def show
    @sun = Sun.find(params[:id])
    render json: @sun, status: 200
  end

end
