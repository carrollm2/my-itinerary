Rails.application.routes.draw do


  # Routes for Google authentication
  # get ‘auth/google/callback’, to: ‘sessions#googleAuth’
  # get ‘auth/failure’, to: redirect(‘/’)

  get '/auth/google_oauth2/callback' => 'sessions#create'

  root to: 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :events
  resources :destinations do
    resources :events
  end

  resources :itineraries

  resources :users do
    resources :itineraries, only: [:index]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
