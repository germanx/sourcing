Sourcing::Application.routes.draw do

scope '(:locale)' do
  
  match '/price' => 'static_pages#price', :as => :price
  match '/contact' => 'static_pages#contact', :as => :contact
  match '/mailgun/post' => 'mailgun#post'
  get 'mailgun/list'
  get 'mailgun/item'
  match 'mailgun/callrequest' 

  root to: 'static_pages#home'
  
  get "stages/edit"

  get "stages/update"

  get "users/index"

  devise_for :users, :controllers => { :registrations => "registrations" }

  get '/awaiting_confirmation',
    :to => "users#confirmation",
    :as => 'confirm_user'

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end  
  end

  put '/admin/users/:user_id/permissions',
          :to => 'admin/permissions#update',
          :as => :update_user_permissions
 
  resources :projects do
    resources :tickets
    resources :responses do
      collection do
        get 'invite'
      end
    end
    member do
      get 'change_state'
    end
  end

  resources :tickets do
    resources :comments
  end

  resources :files
  
  resources :attachments do
    collection do
      get 'manage'
    end
  end
  
  resources :stages

  resources :firms 

end

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
