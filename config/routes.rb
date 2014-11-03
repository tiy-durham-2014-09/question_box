Rails.application.routes.draw do
  root 'questions#home'

  get 'proxy/bing.json' => "bing_proxy#get"

  resource :login, :only => [:show, :create, :destroy]
  resources :users, :only => [:new, :create]
  resources :questions, :only => [:index, :new, :create, :show] do
    member do
		  post :vote
	    get :related, defaults: { format: 'json' }
	    put :sms
    end
    resources :answers, :only => [:create], :shallow => true do
      post :vote, on: :member
    end
  end
  resources :tags, :only => [:index, :show]

  get 'password_reset' => 'password_resets#new', as: :password_reset
  post 'password_reset' => 'password_resets#create'
  get 'password_reset/:id' => 'password_resets#edit', as: :change_password
  patch 'password_reset/:id' => 'password_resets#update'
end
