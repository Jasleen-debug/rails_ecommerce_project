Rails.application.routes.draw do
  # get "food_items/index"
  # get "food_items/show"
  # get "food_categories/index"
  # get "food_categories/show"

  resources :food_items, only: %i[index show]
  root to: "food_items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
