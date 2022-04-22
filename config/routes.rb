Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  resources :recipes do
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
