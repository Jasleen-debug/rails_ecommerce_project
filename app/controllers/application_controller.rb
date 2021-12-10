class ApplicationController < ActionController::Base
  before_action :initialize_session, :configure_permitted_parameters,
                if: :devise_controller?
  helper_method :cart

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    if !session[:shopping_cart].nil?
      FoodItem.find(session[:shopping_cart])
    else
      []
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:province_id])
  end
end
