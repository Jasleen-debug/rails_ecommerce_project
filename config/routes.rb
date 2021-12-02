Rails.application.routes.draw do
  # get "carts/show"
  # get "cart/show"

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  # get "food_items/index"
  # get "food_items/show"
  # get "food_categories/index"
  # get "food_categories/show"

  resources :food_categories, only: %i[index show]
  resources :order_food_items
  resource :carts, only: [:show]

  # resources :food_items, only: %i[index show]

  resources :food_items, only: %i[index show] do
    collection do
      get "search"
    end
  end

  root to: "food_items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
