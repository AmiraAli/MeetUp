Rails.application.routes.draw do

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'signup'  => 'users#new'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'Home'    => 'static_pages#home'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :comments
  resources :posts
  resources :events
  resources :groups
  resources :interests
  resources :interests
  resources :users
  resources :comments
  resources :posts
  resources :events
  resources :groups
  resources :interests
  resources :users
  get '/home/removememberfromgroup', to: 'home#removememberfromgroup', :constraints => { :only_ajax => true }
  get '/home/addmembertogroup', to: 'home#addmembertogroup', :constraints => { :only_ajax => true }
  get '/home/removememberfromevent', to: 'home#removememberfromevent', :constraints => { :only_ajax => true }
  get '/home/addmembertoevent', to: 'home#addmembertoevent', :constraints => { :only_ajax => true }
  get '/home/searchbyinterest', to: 'home#searchbyinterest', :constraints => { :only_ajax => true }
  get '/home/searchgroupname', to: 'home#searchgroupname', :constraints => { :only_ajax => true }
  get '/home/findgroupslocation', to: 'home#findgroupslocation', :constraints => { :only_ajax => true }
  get '/home/findevents', to: 'home#findevents', :constraints => { :only_ajax => true }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
