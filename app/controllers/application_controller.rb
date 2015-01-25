class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?

  def sign_in_required
    if user_signed_in?
      @current_user = User.find(session[:user_id])
    else
      flash[:alert] = "サインインしてください。"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end

  def user_signed_in?
    session[:user_id]
  end
end
