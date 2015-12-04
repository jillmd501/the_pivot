Rails.application.routes.draw do
  root to: "welcome#index"

  get "/about", to: "welcome#about"

  resources :businesses, only: [:index, :show] do
    resources :photos, only: [:show, :index]
  end

  resources :orders, except: [:edit]

  resources :cart_photos, only: [:create, :update]
  get "/cart", to: "cart#index"
  delete "/cart", to: "cart_photos#destroy"
  post "/cart", to: "cart_photos#create"

  resources :users, only: [:new, :create, :update, :edit]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/dashboard", to: "users#show"

  namespace :admin do
    resources :trips

    resources :businesses do
      post "/trips/:id/retire", to: "trips#retire", as: "trip_retire"
      post "/trips/:id/activate", to: "trips#activate", as: "trip_activate"
      resources :trips
    end

    resources :orders, only: [:show]
    get "/dashboard", to: "dashboard#index"
  end
end
