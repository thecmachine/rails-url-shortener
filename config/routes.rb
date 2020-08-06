Rails.application.routes.draw do
  root 'items#home'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   'urls',   to: 'urls#new'
  resources :users, :urls
end
