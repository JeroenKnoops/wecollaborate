Wecollaborate::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'static_pages#home'

  resources :visitors, :only => [:index, :new, :create]
  resources :projects, :only => [:show, :index]
  

  get '/about',   to: 'static_pages#about'
  get '/home',    to: 'static_pages#home'
  
  get '/signup',  to: 'visitors#new'
  get '/ddw',  to: 'visitors#ddw'
  
end
