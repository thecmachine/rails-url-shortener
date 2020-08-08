Rails.application.routes.draw do
  root 'items#home'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  delete 'delete_urls',  to:  'urls#delete'
  get   'urls',   to: 'urls#new'
  get   'short',  to: 'urls#index'

  resources :users, :urls
end
