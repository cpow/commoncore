Commoncore::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "omniauth_callbacks"}
  devise_scope :user do match '/auth/stripe_connect/callback' => 'omniauth_callbacks#stripe_connect' end

  resources :leads

  match 'posts/page/:page' => 'posts#index'

  authenticated :user do
    root :to => 'posts#index'
  end

  root :to => "landing#index"
  devise_for :users
  resources :landing
  resources :posts do
    resources :comments
    get :index
    get :show
  end

  resources :lesson_plan_dashboard

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
