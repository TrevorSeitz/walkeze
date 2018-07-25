class DogsController < ApplicationController

  def new
    @dog = Dog.new
  end

  def index
    @dogs = Dog.all
  end

  def create
    @error = false
    @user = User.find(session[:user_id])
    @dog = Dog.create(dog_params)
    @dog.user_id = @user.id
    @dog.save
    if @dog.valid?
      redirect_to user_path(@user)
    else
      @error = true
      render :action => :new, dog_params: dog_params
    end
  end

  def update
    @dog = Dog.find(params[:id])
  end

  def show
    @user = User.find(session[:user_id])
    @dog = Dog.find(params[:id])
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :user_id, :notes)
  end

end
