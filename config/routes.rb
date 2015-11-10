Rails.application.routes.draw do
  resources :cities, only: [:index, :show] do
    resources :categories, only: [:show] 
  end
end
