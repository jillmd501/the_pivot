Rails.application.routes.draw do
  root to: "welcome#index"

  get "/about", to: "welcome#about"
  get "/cart", to: "cart#index"
  delete "/cart", to: "cart_photos#destroy"
  post "/cart", to: "cart_photos#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"

  resources :businesses, only: [:index, :show] do
    resources :photos, only: [:show, :index, :new, :create] do
      member { get :download }
    end
  end
  resources :categories, only: [:show]
  resources :orders, except: [:edit] do
    member { get :download }
  end
  resources :cart_photos, only: [:create, :update]
  resources :users, only: [:new, :create, :update, :edit]
  namespace :admin do
    resources :businesses do
      resources :photos
    end
    resources :orders, only: [:show]
    get "/dashboard", to: "dashboard#index"
  end
end
