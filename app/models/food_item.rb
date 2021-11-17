class FoodItem < ApplicationRecord
  has_one_attached :image
  belongs_to :food_category
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
  paginates_per 12
  # Hello friends
end
