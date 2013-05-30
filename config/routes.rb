Quting::Application.routes.draw do
  resources :mfiles
  resources :media
  namespace :api do
    resources :media
  end
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
