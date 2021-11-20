class Order < ApplicationRecord
  belongs_to :user

  has_many :order_food_items
  has_many :food_items, through: :order_food_items

  before_save :set_subtotal

  def subtotal
    order_food_items.collect{|order_food_item| order_food_item.valid? ? order_food_item.unit_price*order_food_item.quantity :0}.sum
  end

  private
  def set_subtotal
    self[:subtotal] = subtotal
  end

end
