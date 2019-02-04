class MatchesController < ApplicationController

  def index
    @matched = Match.all
    render json: @matches, status: 200
  end

  def show
    @match = Match.find(params[:id])
    render json: @match, status: 200
  end


  def create
    # @match = Match.create(params[:id])
    @match = Match.create(match_params)
    if @match.valid?
      render json: @match, status: 200
    else
      render json: @match.errors_full_messages, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:sun_id, :compatible_sun_id)
  end

end
