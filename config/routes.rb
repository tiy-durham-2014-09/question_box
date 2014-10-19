Rails.application.routes.draw do
post 'question/create'

  #HOMEPAGE
  post 'homepage/create'


  # get 'homepage/index'
  # #
  # #QUESTIONS AND ANSWERS
  # get 'question_and_answers/show'
  # get 'question_and_answers/create'
  #
  # #ALL QUESTIONS
  # get 'all_questions/index'
  #
  # #LOGIN
  #   post 'login/new'
  #   post 'login/create'
    delete 'login/destroy'
  #
  #
  # #USERS
  # get 'users/create'
  # get 'users/new'

  resources :users, :only => [:create, :new]
  resources :login, :only => [:new,:create, :destroy]
  resources :all_questions, :only => [:index]
  resources :homepage
  resources :question, :only => [:new, :edit,:create, :update, :destroy, :show]

  root 'question#index'
  # resources :users, only => [:create,:new]



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
