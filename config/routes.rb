Rails.application.routes.draw do


  post 'users/invite'

  get 'skills/edit', as: :edit_skills

  post 'skills/update', as: :update_skills

  get 'join_classes/index'
  post 'join_classes/join_courses'


  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


  resources :notifications, :only => [:index] do
  member do
    post :accept
    post :reject
    delete :mark_as_read
  end
  end

  devise_for :users
resources :users, :only => [:show, :edit]

   authenticated :user do
     root "home#index", as: "authenticated_root"
	end

  resources :courses do
    post 'edit_time_commitment', on: :member
    post 'join', on: :member
    post 'leave', on: :member
    resources :teams do
      get 'join', on: :member
      post 'join_try', on: :member
      post 'express_interest', on: :member
      delete 'leave', on: :member
    end
  end
  resources :teams
  #resources :students
  resources :profile

	root "welcome#index"








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
