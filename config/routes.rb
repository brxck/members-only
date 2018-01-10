Rails.application.routes.draw do
  root 'posts#index'

  get   '/login',  to: 'sessions#new'
  post  '/login',  to: 'sessions#create'
  get   '/logout', to: 'sessions#destroy'

  get  '/write',   to: 'posts#new'
  post '/write',   to: 'posts#create'
  get  '/read',    to: 'posts#index'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
end
