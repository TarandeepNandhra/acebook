class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  skip_before_action :verify_authenticity_token

  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :set_user

  def login!
    session[:user_id] = @user_id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logout!
    session.clear
  end
end
