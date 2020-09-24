Rails.application.routes.draw do


  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  root to: 'sessions#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # Routes for Google authentication
  get '/auth/google_oauth2/callback' => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post 'users/:user_id/itineraries/selected_city', to: 'itineraries#selected_city'

  resources :events
  resources :itineraries

  resources :destinations do
    resources :events
  end

  post '/destinations/:id', to: 'destinations#chosen_destination'

  resources :users do
    resources :itineraries, only: [:index]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
