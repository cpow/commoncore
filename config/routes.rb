Commoncore::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :leads

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
  resources :core_standards do
    collection do
      get :specific_core_standard
    end
  end

  resources :users do
    resources :posts do
      resources :comments
    end
    resources :lesson_plans do
      resources :comments
    end
    resources :posts do
      get :new
      post :create
    end
  end
end