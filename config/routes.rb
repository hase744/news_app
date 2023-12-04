Rails.application.routes.draw do
  get 'documents/privacy_policy'
  resource  :videos
  namespace :user do
    delete  '/favorites/delete_multiple'
    delete  '/favorites/delete_all'
    post  '/favorites/create_multiple'
    get  '/favorites/search'
    resources :favorites

    delete  '/histories/delete_multiple'
    delete  '/histories/delete_all'
    post  '/histories/create_multiple'
    get  '/histories/search'
    resources :histories
  end
  #get 'videos/index'
  resource :presses, only: [:show]
  resource :categories, only: [:show]
  resource :versions, only: [:show]
  #get 'presses/index'
  get 'homes/index'
  get 'homes/search'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"

  
end
