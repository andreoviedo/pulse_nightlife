class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :date_of_birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :date_of_birth])
  end
end
