Commoncore::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "landing#index"
  devise_for :users
  resources :landing
  
  resources :users do
    resources :lesson_plans do
      resources :comments
    end
  end
end