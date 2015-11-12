Rails.application.routes.draw do
  root to: "cities#index"
  resources :cities, only: [:index] do
    resources :trips, only: [:show, :index]
  end
  
  resources :cart_trips, only: [:create, :update]
  get "/cart", to: "cart_trips#index"
  delete "/cart", to: "cart_trips#destroy"

  resources :users, only: [:new, :create, :show]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#index"
end
