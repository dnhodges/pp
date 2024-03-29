Pp::Application.routes.draw do
  resources :tax_rates

  resources :driver_schedules

  resources :drivers

  get "customer/index"

  resources :include_drinks

  resources :drinks

  get 'admin' => 'admin#index'

  #get 'edit_user' => 'users#edit'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :purchases

  resources :preferences

  resources :orders

  resources :ingredients

  resources :combos

 # get 'users/history', as: 'history'
 # match 'history/:id' => 'users#history'

  match 'users/:id/history' => 'users#history', :as => :history

  #match 'orders/:id/reorder' => 'orders#reorder', :as => :reorder

  match 'purchases/:id/reorder' => 'purchases#reorder', :as => :reorder

  match 'inactive' => 'users#inactive', :as => :inactive

  match 'ordersxml' => 'orders#ordersxml', :as => :ordersxml

  match 'preferred_customers' => 'users#preferred_customers', :as => :preferred_customers
  match 'time_window_revenue' => 'orders#time_window_revenue', :as => :time_window_revenue
  match 'happy_hour_analysis' => 'orders#happy_hour_analysis', :as => :happy_hour_analysis
  
  get 'store/set_happy_hour', as: "set_happy_hour"
  get "store/index", as: 'store'

  match '/orders/revenue_report', :controller => 'orders', :action => 'revenue_report' #resources :orders
  resources :pizzas do
    get :who_bought, on: :member
  end

  #root to: 'preferences#new'
  root to: 'store#index', as: 'store'
  #root to: 'sessions#new', as: 'login'
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
