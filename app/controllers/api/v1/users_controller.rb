class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :sun_compats]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    render json: @user, status: 200
  end

  def sun_compats
    @name = @user.full_name
    @sun_compats = @user.sun.compatibilities
    render json: [@name, @sun_compats], status: 200
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      render json: @user, status: 200
    # if @user.id
    #   redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

#   def create
#   @user = User.create(user_params)
#   if @user.valid?
#     render json: @user, status: :ok
#   else
#     render json: @user.errors.full_messages, status: :unprocessable_entity
# end
# end

  # def edit
  #   @user = User.find(params[:id])
  # end
  #
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to users_path
  #   else
  #     flash[:errors] = @user.errors.full_messages
  #     redirect_to edit_user_path
  #   end
  # end
  #
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to users_path
  # end

  private

  def user_params
     params.require(:user).permit(:name, :birth_month, :birth_day, :birth_year, :zodiac_id)
   end

   def find_user
     @user = User.find(params[:id])
   end

end
