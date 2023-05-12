Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :prototypes, only: [:new, :create, :index, :show, :edit, :update, :destroy ] 
  # get 'prototypes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
 