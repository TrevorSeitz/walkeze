class WalksController < ApplicationController

  def index
    @walks = Walk.all
    @user = User.find(session[:user_id])
  end

  def create
    @walk = Walk.find(params[:id].to_i)
    # if (params[:dog_ids].map(&:to_i) & @walk.dogs.ids).count > walk.available_spots
    # return error
    #byebug
    @walk.dogs = Dog.where(id: params[:dog_ids])
    @walk.save

    redirect_to user_path(current_user)
  end

  def update
    byebug
  end

  def edit
    @walk = Walk.find(params[:id].to_i)
    @user = User.find(session[:user_id])
    @dogs = Dog.where(user_id: @user.id)
  end

  def show
    @walk = Walk.find(params[:id].to_i)
  end



  private

  def walk_params
    params.require(:walk).permit(:name, :length, :available, :available_spots, :date, :time, :notes)
  end

end
