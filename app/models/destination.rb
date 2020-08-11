class Destination < ApplicationRecord
    has_many :itineraries
    has_many :events
end
