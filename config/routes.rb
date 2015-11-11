Rails.application.routes.draw do
  root to: "cities#index"
  resources :cities, only: [:index] do
    resources :trips, only: [:show, :index]
  end

  resources :cart_trips, only: [:create]
  get "/cart", to: "cart_trips#index"
  delete "/cart", to: "cart_trips#destroy"
end
