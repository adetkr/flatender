Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats do
    post 'flat_equipments'
  end

  get '/myflats', to:"pages#myflats"

  resources :likes, only: [:create]
  resources :matches, only: [:show, :index] do
    resources :messages, only: :create
    resources :contracts, only: [:create, :show ]
  end
  resources :searches, only: [:index, :create]
  resources :users, only: [:update, :show, :edit]
  get '/generate_contract/:contract_id', to: 'contracts#pdf_generate', as: 'pdf'
  get '/sign_contract/:contract_id', to: 'contracts#sign_contract', as: 'sign_contract'

  get '/docusign/callback/:contract_id', to: 'pages#callback'
  get '/docusign/initiate', to: 'pages#initiate'
end
