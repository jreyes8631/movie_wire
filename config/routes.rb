Rails.application.routes.draw do
  resources :reviews

  resources :movies do
    resources :reviews
    get :current_user_movies, on: :collection
    get :current_user_reviews, on: :collection
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'movies#index'
end
