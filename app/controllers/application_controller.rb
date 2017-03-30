class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_teacher!
    redirect_to "/courses" unless current_user.role.name == "teacher" || current_user.role.name == "admin"
  end

end