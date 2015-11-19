Rails.application.routes.draw do
  root to: "welcome#index"

  get "/about", to: "welcome#about"

  resources :cities, only: [:index, :show] do
    resources :trips, only: [:show, :index]
  end

  resources :orders, except: [:edit]

  resources :cart_trips, only: [:create, :update]
  get "/cart", to: "cart_trips#index"
  delete "/cart", to: "cart_trips#destroy"

  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/dashboard", to: "users#show"

  namespace :admin do
    resources :trips
    
    resources :cities do
      resources :trips
    end

    resources :orders, only: [:show]
    get "/dashboard", to: "dashboard#index"
  end
end
