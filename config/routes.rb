Rails.application.routes.draw do
  root to: 'pages#home'

  resources :users
  resources :sessions
  resources :menus

  resources :recipes do
    resources :ratings
  end

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/signup' => 'users#create'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
end
