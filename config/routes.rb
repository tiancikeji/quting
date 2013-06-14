Quting::Application.routes.draw do
  

  namespace :api do
    resources :media
    resources :mfiles
    resources :users
    resources :guests
    resources :likes do
      collection do
        get 'cancel'
      end
    end
    resources :buys
  end
  resources :buys
  resources :guests
  resources :likes
  resources :mfiles
  resources :media
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end
