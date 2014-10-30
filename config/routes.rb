Commoncore::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "omniauth_callbacks"}
  devise_scope :user do
    get '/auth/stripe_connect/callback', to: 'omniauth_callbacks#stripe_connect'
  end

  resources :leads

  get 'posts/page/:page', to: 'posts#index'

  root to: "landing#index"
  resources :landing
  resources :posts do
    resources :comments
  end

  resources :core_standards do
    collection do
      get :specific_core_standard
    end
  end

  resources :users do
    resources :posts do
      get :new
      post :create
      resources :comments
    end
    resources :home, only: [:index]
    resources :lesson_plans do
      resources :products, only: [:new, :create]
      resources :comments
    end
  end
end
