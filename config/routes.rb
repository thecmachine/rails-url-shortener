Rails.application.routes.draw do
  root 'items#home'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  delete 'delete_urls',  to:  'urls#destroy'
  get   'urls',   to: 'urls#new'
  get   'short',  to: 'urls#index'

  get   'links/:id', to: 'links#index', as: 'shortlink'

  resources :users, :urls
end
