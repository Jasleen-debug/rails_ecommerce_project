class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:province_id])
  end
end
