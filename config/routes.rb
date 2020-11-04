Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/sign_out' => 'devise/sessions#destroy'
  resources :flats
  resources :likes, only: [:create]
  # resources :users, only: [:update, :show, :edit]
end
