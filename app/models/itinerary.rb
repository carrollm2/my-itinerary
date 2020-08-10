class Itinerary < ApplicationRecord
    belongs_to :user
    has_many :destinations
    has_many :itinerary_events
end
