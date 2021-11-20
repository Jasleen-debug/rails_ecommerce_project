class CreateOrderFoodItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_food_items do |t|
      t.integer :quantity
      t.decimal :total
      t.decimal :unit_price
      t.references :order, null: false, foreign_key: true
      t.references :food_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
