class Event < ApplicationRecord
    belongs_to :destination
    has_many :itineraries
    has_many :users, through: :itineraries

    validates :description, :destination_id, :event_date, presence: { message: "must be populated" }, on: :create
    validates_length_of :ticket_site, minimum: 5, maximum: 200, allow_blank: true

    validates_uniqueness_of :description, :scope => [:destination_id, :event_date], :message=>"matches event occurring in same destination and on the same date", on: :create

end
