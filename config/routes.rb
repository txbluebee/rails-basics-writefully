Rails.application.routes.draw do
  root to: 'posts#index'

  resources :users

  resource :session

  resources :posts do
    resources :comments
  end
end
