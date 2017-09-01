Rails.application.routes.draw do
  root to: 'posts#index'

  resources :users, only: [:create]
  resource :session, only: [:create]

  resources :confirmation

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

  get 'register' => 'users#new'


  resource :session, only: [:create]

  resources :posts do
    resources :comments
  end
end
