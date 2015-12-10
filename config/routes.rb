Rails.application.routes.draw do
  root to: "welcome#index"

  get "/about", to: "welcome#about"
  get "/cart", to: "cart#index"
  get "/photos", to: "photos#catalog"
  delete "/cart", to: "cart_photos#destroy"
  post "/cart", to: "cart_photos#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"

  resources :businesses, param: :name, only: [:index, :show, :new, :create] do
    resources :photos, param: :identifier, only: [:show, :index] do
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
  resources :businesses, param: :name do
    member { get :toggle_status }
    resources :photos, param: :identifier, except: [:show]
    resources :users, except: [:create]
  end
    resources :orders, only: [:show]
    get "/dashboard", to: "dashboard#index"
  end
end
