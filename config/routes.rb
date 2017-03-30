Rails.application.routes.draw do
  root to: 'pages#home'

  resources :users
  resources :sessions

  resources :recipes do
    resources :ratings
  end

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
end
