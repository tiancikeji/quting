Quting::Application.routes.draw do
  resources :guests
  resources :likes
  resources :mfiles
  resources :media
  namespace :api do
    resources :media
    resources :users
    resources :guests
    resources :likes
  end
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
