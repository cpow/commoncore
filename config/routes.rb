Commoncore::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "landing#index"
  devise_for :users
  resources :users
  resources :landing
end