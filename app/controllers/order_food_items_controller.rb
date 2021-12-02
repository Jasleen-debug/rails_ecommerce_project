class OrderFoodItemsController < ApplicationController
  before_action :set_order

  def create
    @order_food_item = @order.order_food_items.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  # def update
  #   @order_food_item = @order.order_food_items.find(params[:id])
  #   @order_item.update_attributes(order_params)
  #   @order_items = current_order.order_items
  # end

  # def destroy
  #   @order_food_item = @order.order_food_items.find(params[:id])
  #   @order_food_item.destroy
  #   @order_items = current_order.order_items
  # end

  def order_params
    params.require(:order_food_item).permit(:food_item_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
