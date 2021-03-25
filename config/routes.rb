Rails.application.routes.draw do
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
end