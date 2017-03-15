Rails.application.routes.draw do
  root to: "dashboard#index"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users, only: [:show, :index]


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'

end
