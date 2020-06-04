Geofly::Application.routes.draw do
  resources :payment_notifications
  get 'posts/share', to: 'posts#share'
  get '/assets/images/ajax-loader.gif', to: redirect('/images/ajax-loader.gif')
  get 'posts/facepaste', to:   'posts#paste'
  get 'posts/eraseface' , to:   'posts#erase'
  get 'posts/premium', to: 'plans#link'
 
  get 'posts/mygeoflys', to: 'posts#tag' 
  resources :subscriptions
  resources :plans
   resources :profiles
   get 'paypal/checkout', to: 'subscriptions#paypal_checkout'
   #resources :welcome
get "welcome/index" => "welcome#index"
get "test_app" => "welcome#index" 
resources :posts
get "users/thanks" => "users#thanks"

post "oauth/callback" => "oauths#callback"
get "oauth/callback" => "oauths#callback" # for use with Github
get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider  
  
root :to => 'welcome#index'
get "/privacy" => 'welcome#privacy'
get "/help" => 'welcome#help'
resources :user_sessions

resources :users do
  member do
    get :activate
  end
end

get 'login' => 'user_sessions#new', :as => :login
post 'logout' => 'user_sessions#destroy', :as => :logout
get 'cancel' => 'user_sessions#face_javascript'


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
