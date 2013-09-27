Looking::Application.routes.draw do

  devise_for :users, :controllers => {:sessions => "sessions", :registrations => "registrations"} 
  
  resources :microposts

  match '/users',                     :to => 'users#index', :via => "get"
  match '/arts_and_crafts',             :to => 'pages#arts_and_crafts'
  match '/automotive_and_motorcycle',   :to => 'pages#automotive_and_motorcycle'
  match '/books',                     :to => 'pages#books'
  match '/boats',                     :to => 'pages#boats'
  match '/clothing',                  :to => 'pages#clothing'
  match '/collectable',               :to => 'pages#collectable'
  match '/electronics',               :to => 'pages#electronics'
  match '/farm_and_garden',             :to => 'pages#farm_and_garden'
  match '/furniture',                 :to => 'pages#furniture'
  match '/jewelry',                   :to => 'pages#jewelry'
  match '/music_and_musical_instruments',:to => 'pages#music_and_musical_instruments'
  match '/sportinggoods',             :to => 'pages#sportinggoods'
  match '/services_wanted',             :to => 'pages#services_wanted'
  match '/contact',                   :to => 'pages#contact'
  match '/howitworks',                :to => 'pages#howitworks'
  match '/microposts',                :to => 'pages#microposts' 
  match '/categories',                :to => 'pages#categories'
  match '/termsofservice',            :to => 'pages#termsofservice'
  root :to => 'pages#home'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
