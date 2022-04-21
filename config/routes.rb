Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :recipes do
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
end
