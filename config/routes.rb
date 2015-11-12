Rails.application.routes.draw do
  root to: "welcome#index"
  resources :cities, only: [:index] do
    resources :trips, only: [:show, :index]
  end

  resources :cart_trips, only: [:create, :update]
  get "/cart", to: "cart_trips#index"
  delete "/cart", to: "cart_trips#destroy"
end
