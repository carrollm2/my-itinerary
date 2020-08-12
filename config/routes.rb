Rails.application.routes.draw do

  root to: 'users#new'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :itinerary_events
  resources :events
  resources :destinations
  resources :itineraries
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
