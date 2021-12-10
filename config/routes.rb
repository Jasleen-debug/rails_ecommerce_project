Rails.application.routes.draw do
  get "orders/show"
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :food_categories, only: %i[index show]
  resources :order_food_items
  resources :cart, only: %i[create destroy]

  resources :food_items, only: %i[index show] do
    collection do
      get "search"
    end
  end

  root to: "food_items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
