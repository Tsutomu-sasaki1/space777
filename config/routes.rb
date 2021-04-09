Rails.application.routes.draw do
  get 'messages/new'
  get 'chatrooms/new'
  devise_for :users
  root to: "posts#index" 
  
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
  resources :chatrooms,           only: [:new, :create, :destroy] do
    resources :messages,            only: [:new, :create, :destroy]
  end
  resources :myrooms 
  resources :relationships,       only: [:create, :destroy]
end