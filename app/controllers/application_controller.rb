class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions
  before_action :configure_permitted_parameters, if: :devise_controller?

  def access_denied(exception)
    flash[:danger] = exception.message
    redirect_to root_url
  end

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this resource!"
      redirect_to root_path
   end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end



end
