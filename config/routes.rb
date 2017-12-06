Rails.application.routes.draw do
  resources :messages
  resources :student_group_associations
  resources :student_groups
  resources :resources
  resources :post_threads
  resources :posts
  resources :users
  resources :groups
  resources :mentees
  resources :matches
  resources :mentors
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'home/signin', to: 'home#signin', as: :signin
  get 'home/menteedashboard', to: 'home#menteedashboard', as: :menteedashboard
  get 'home/mentordashboard', to: 'home#mentordashboard', as: :mentordashboard
  get 'home/dashboard', to: 'home#dashboard', as: :dashboard
  
  get 'new_mentor', to: 'users#new_mentor', :as => "new_mentor_signup"

  get 'home/public_forum', to: 'home#public_forum', as: :public_forum
  
  get  '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get "sign_up" => "users#new", :as => "sign_up"
  get "/profile", to: "users#index"
  get "home/mentor_matches", to: 'home#mentor_matches', as: :mentormatches


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
