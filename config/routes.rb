Rails.application.routes.draw do
  root to: "cities#index"
  resources :cities, only: [:index] do
    resources :categories, only: [:show, :index]
  end

  resources :cart_categories, only: [:create]
  get '/cart', to: 'cart_categories#index'
end
