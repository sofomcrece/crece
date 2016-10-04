Rails.application.routes.draw do
  resources :customers
  resources :credits
  resources :payouts
  resources :loans
  resources :products
  devise_for :users
  resources :agents
  resources :companies
  resources :branch_offices
  resources :users
  get 'perfil',to:'users#perfil',as:'perfil'
   post 'users/create2',to:'users#create2'
   resources :view_credits
#  get 'profile/show',to:'profile#show',as:'show_profile'
#  get 'profile/new',to:'profile#new',as:'new_profile'
#  post 'profile/create',to:'profile#create',as:'create_profile'
#  get 'profile',to:'profile#index',as:'profile'
#  patch 'profile/update',to:'profile#update',as:'update_profile'
  
  devise_for :models
  get 'welcome/hola'

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#hola'

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
