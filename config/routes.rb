Rails.application.routes.draw do
  root to: 'posts#index'

  namespace :auth do
    resources :users, only: [:create]
    resource :session, only: [:create]
    resource :confirmation
  end  

  get 'login' => 'auth/sessions#new'
  delete 'logout' => 'auth/sessions#destroy'

  get 'register' => 'auth/users#new'


  resource :session, only: [:create]

  resources :posts do
    resources :comments
  end
end
