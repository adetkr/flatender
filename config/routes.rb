Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats
  resources :likes, only: [:create]
  resources :contracts, only: [:show]
  resources :matches, only: [:show] do
    resources :messages, only: :create
    resources :contracts, only: [:create]
  end
  resources :users, only: [:update, :show, :edit]
end
