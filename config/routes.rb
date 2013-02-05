Commoncore::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "landing#index"
  devise_for :users
  resources :landing
  resources :core_standards do
    collection do
      get :specific_core_standard
    end
  end
  
  resources :users do
    resources :lesson_plans do
      resources :comments
    end
  end
end