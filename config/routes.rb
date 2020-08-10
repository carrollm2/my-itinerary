Rails.application.routes.draw do
  resources :itinerary_events
  resources :events
  resources :destinations
  resources :itineraries
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
