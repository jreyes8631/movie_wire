Rails.application.routes.draw do
  resources :reviews
  resources :movies do
    resources :reviews, only: [:index, :new, :show]
  end
  devise_for :users
  root to: 'movies#index'
end
