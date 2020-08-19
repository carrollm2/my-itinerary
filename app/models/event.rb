class Event < ApplicationRecord
    belongs_to :destination
    has_many :itineraries
    has_many :users, through: :itineraries
end
