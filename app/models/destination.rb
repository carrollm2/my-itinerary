class Destination < ApplicationRecord
    has_many :itineraries
    has_many :events
    
    has_many :users, through: :itineraries
end
