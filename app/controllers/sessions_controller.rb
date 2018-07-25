class SessionsController < ApplicationController

  def new

  end

  def create
    if params[:email]
      @user = User.find_or_create_by(email: params[:email])
    else
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
      end
    end

    session[:user_id] = @user.id

    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session.clear
    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
