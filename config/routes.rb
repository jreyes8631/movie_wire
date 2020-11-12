Rails.application.routes.draw do
  resources :reviews

  resources :movies do
    resources :reviews, except: [:show, :index]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'movies#index'
end
