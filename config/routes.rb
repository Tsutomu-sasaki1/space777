Rails.application.routes.draw do
  get 'chatrooms/new'
  devise_for :users
  root to: "posts#index" 
  resources :myrooms 

  resources :posts do
    collection do
      get 'search'
    end
    member do
      get 'myroom'
    end
  end
  resources :users do
    member do
     get 'following', 'followers'
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :chatrooms,           only: [:new, :create, :destroy]
end