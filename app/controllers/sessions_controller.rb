class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    user = User.find_and_update_with_omniauth(auth) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to timeline_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
