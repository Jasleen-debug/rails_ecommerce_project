class OrderFoodItemsController < ApplicationController
  before_action :load_order, only: [:create]

  def create
    @order_food_item = @order.order_food_items.new(quantity: 1, food_item_id: params[:food_item_id])

    respond_to do |format|
      if @order_food_item.save
        format.html { redirect_to @order, notice: "Successfully added product to cart." }
        format.json { render action: "show", status: :created, location: @order_food_item }
      else
        format.html { render action: "new" }
        format.json { render json: @order_food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_order
    @order = Order.find_or_create_by(session[:order_id], status: "unsubmitted")
    if @order.new_record?
      @order.save!
      session[:order_id] = @order.id
    end
  end
end
