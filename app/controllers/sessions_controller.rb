class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
    end

    session[:user_id] = @user.id

    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    # session[:user_id] = nil
    redirect_to destroy_user_session_path, method: :delete
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
