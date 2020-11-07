Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats do
    post 'flat_equipments'
  end

  resources :likes, only: [:create]
  resources :matches, only: [:show, :index] do
    resources :messages, only: :create
  end
  resources :users, only: [:update, :show, :edit]

end
