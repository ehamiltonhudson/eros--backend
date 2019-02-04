class MatchesController < ApplicationController

  def index
    @matched = Match.all
    render json: @matches, status: 200
  end

  def show
    @match = Match.find(params[:id])
    render json: @match, status: 200
  end

end
