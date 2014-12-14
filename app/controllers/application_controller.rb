class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def sign_in_required
    if session[:user_id].present?
      @current_user = User.find(session[:user_id])
    else
      flash[:alert] = "サインインしてください。"
      redirect_to root_path
    end

  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    true if session[:user_id].present?
  end
end
