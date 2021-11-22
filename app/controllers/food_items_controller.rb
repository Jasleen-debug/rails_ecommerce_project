class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.includes(:food_category).all.page params[:page]
  end

  def show
    @food_item = FoodItem.find(params[:id])
    @order_food_item = current_order.order_food_items.new
  end

  def search
    # @food_items = FoodItem.search(params[:keywords])
    @food_items = if params[:food_category_id].to_s == ""
                    FoodItem.where("name LIKE ?", "%#{params[:search_term]}%")
                  else
                    FoodItem.where("food_category_id = ? AND name LIKE ?", params[:food_category_id].to_s,
                                   "%#{params[:search_term]}%")
                  end
  end
end
