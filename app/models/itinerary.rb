class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :destinations
end
