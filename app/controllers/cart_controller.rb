class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart] ||= []
    session[:shopping_cart] << id
    food_item = FoodItem.find(id)
    flash[:notice] = "+ #{food_item.name} added to cart."
    redirect_to root_path
  end

  def destroy
    logger.debug("Removing #{params[:id]} from cart.")
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    food_item = FoodItem.find(id)
    flash[:notice] = "- #{food_item.name} removed from cart."
    redirect_to root_path
  end

  def show; end
end
