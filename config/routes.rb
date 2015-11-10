Rails.application.routes.draw do
  root to: "welcome#index"
  resources :cities, only: [:index, :show] do
    resources :categories, only: [:show]
  end
end
