Rails.application.routes.draw do

  devise_for :users
  get 'users/:id/edit' => 'users#edit'
  get 'users/:type' => 'users#index', :as => "users"
  post 'users/:user_id/reset_password' => 'users#reset_password', :as => "reset_password_user"
  get 'users/:user_id/add_to_profile' => 'users#add_to_profile'
  get 'users/:user_id/:status' => 'users#updat_status', :as => "updat_status_user"
  post 'delete_all' => 'home#delete_all'
  get 'forums/:type' => 'forums#index', :as => "forums"
  get 'forums/:id/close' => 'forums#close'
  get 'forums/:id/approve' => 'forums#approve'
  get '/articles' => 'profiles#index'

  resources :users
  namespace :api do
  namespace :v1 do
      resources :notifications
      resources :designations
      resources :forums, only:[:index, :show, :create, :update] do
        post 'replay'
        get 'close', on: :member
      end
      resources :gallaries
      get "districts" => 'districts#index' 
      get "profiles" => 'profiles#index' 
      get "deleted_profile" => 'profiles#deleted_profile' 
      resources :users do
        post :login, :on => :collection
        post :logout, :on => :collection
        post :userupdate, :on => :collection
        post :resetpassword, :on => :collection 
        post :forgotpassword, :on => :collection
        post :profile, :on => :collection
        post :forgotpassword, :on => :collection
      end
    end
  end

  resources :profiles do
    get "impot_xcel", on: :collection
    post "upload_excel", on: :collection
    get 'get_talukas', :on => :collection
  end
  resources :notifications
  resources :gallaries
  get 'changepassword/index'

  get 'changepassword/update'

  devise_for :admins
  root 'profiles#index'
  post 'change_password' => 'changepassword#update' 
  get 'change_password' => 'changepassword#edit' 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
