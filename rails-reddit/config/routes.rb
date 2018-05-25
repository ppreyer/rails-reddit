Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :comments
  resources :users
  resources :logins

  get 'logout', to: 'logins#destroy', as: 'logout'

  root 'posts#index'
end
