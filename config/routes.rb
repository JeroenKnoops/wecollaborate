Wecollaborate::Application.routes.draw do

  resources :visitors, :only => [:index, :new, :create]
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: 'static_pages#home'


  resources :projects, :only => [:show, :index]
  
  # resources :authentications
  # resources :friendships
  # devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "authentications#create", registrations: "registrations"}

  ActiveAdmin.routes(self)

  get '/about-creative-commons-policy' => 'static_pages#about_creative_commons_policy', as: 'about_cpp'
  get '/terms-and-conditions' => 'static_pages#terms_and_conditions', as: 'terms'
  
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/home',    to: 'static_pages#home'
  get '/construction', to: 'static_pages#construction'
  
  get '/signup',  to: 'visitors#new'
  get '/ddw',  to: 'visitors#ddw'
  
  # get 'timeline', to: 'timeline#show'
  # get '/people',  to: 'people#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   get 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   get 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # get ':controller(/:action(/:id))(.:format)'
end
