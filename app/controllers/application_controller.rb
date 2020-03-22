class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_full_name

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fname lname])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[fname lname])
  end

  def user_full_name
    return unless current_user

    @user_full_name = current_user.fname + ' ' + current_user.lname
  end
end
