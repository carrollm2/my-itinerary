class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :destination
    belongs_to :event
end
