class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorized?

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authorized?(resource)
    current_user == resource.user
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end
end
