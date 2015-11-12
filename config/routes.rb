Rails.application.routes.draw do
  root to: "cities#index"
  resources :cities, only: [:index] do
    resources :categories, only: [:show, :index]
  end

  resources :cart_categories, only: [:create]
  get "/cart", to: "cart_categories#index"
  delete "/cart", to: "cart_categories#destroy"

  resources :users, only: [:new, :create, :show]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#index"
end
