Rails.application.routes.draw do
  root to: "welcome#index"

  get '/signup', to: 'users#new'
  resources :users, only: [:show, :index, :create]


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#index'

end
