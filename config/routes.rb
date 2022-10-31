Rails.application.routes.draw do
  root 'main#index'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
#session routes
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  get  '/welcome' => 'sessions#welcome'
#user routes
  get '/signup' => 'user#new'
  post '/users' => 'user#create'
  
  get '/' => 'user#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end