class Event < ApplicationRecord
    belongs_to :destination
    has_many :itineraries
end
