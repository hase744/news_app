Rails.application.routes.draw do
  resource  :videos
  #get 'videos/index'
  get 'categories/index'
  get 'homes/index'
  get 'homes/search'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"
end
