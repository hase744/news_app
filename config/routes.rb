Rails.application.routes.draw do
  resource :fakes, only: [:show]
  get 'fakes/videos'
  get 'fakes/presses'
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
    resources :summaries, only: [:create, :index]
  end
  #get 'videos/index'
  resources :presses, only: [:show, :index]
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
  #root "homes#index"

  
end
