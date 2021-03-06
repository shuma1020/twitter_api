class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to new_post_path
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end