class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to '/signup' if !logged_in?
  end

end