class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.includes(:food_category).all.page params[:page]
  end

  def show
    @food_item = FoodItem.find(params[:id])
  end

  def search
    @food_items = FoodItem.search(params[:keywords])
  end
end
