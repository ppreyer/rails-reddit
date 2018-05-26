Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
    member do
      post 'upvote'
      post 'downvote'
    end
  end
  resources :comments
  resources :users
  resources :logins

  get 'logout', to: 'logins#destroy', as: 'logout'

  root 'posts#index'
end
