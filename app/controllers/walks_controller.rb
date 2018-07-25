class WalksController < ApplicationController

  def index
    @walks = Walk.all
    @user = User.find(session[:user_id])
  end

  def create
    @walk = Walk.find(params[:id].to_i)
    params[:dog_ids].map(&:to_i).each do |d|
      if !@walk.dogs.ids.include?(d)
        @dog = Dog.find(d)
        @walk.dogs << @dog
      end
    end
    @walk.dogs.each do |wd|
      if !params[:dog_ids].map(&:to_i).include?(wd.id)
        if wd.user_id == current_user.id
          @walk.dogs.delete(wd)
        end
      end
    end
    @walk.save
    render 'confirm_walk'
  end

  def update
    byebug
    @dogs_walk_id = DogsWalk.where(dog_id: params[:dog_id], walk_id: params[:walk_id]).ids[0]
    @dogs_walk = DogsWalk.find(@dogs_walk_id)
    @dogs_walk.notes = params[:note]
    @dogs_walk.save
    @walk = Walk.find(params[:walk_id].to_i)
    render 'confirm_walk'
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
