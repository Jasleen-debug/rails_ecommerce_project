class FoodItem < ApplicationRecord
  has_one_attached :image
  belongs_to :food_category
  has_many :order_food_items
  has_many :orders, through: :order_food_items

  validates :name, :description, :price, presence: true
  validates :price, numericality: true
  paginates_per 12

  def self.search(keywords)
    if keywords
      where("name LIKE ?", "%#{keywords}%").order("name DESC")
    else
      order("name DESC")
    end
  end
end
