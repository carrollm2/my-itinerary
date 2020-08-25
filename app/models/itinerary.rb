class Itinerary < ApplicationRecord
    belongs_to :user
    belongs_to :destination
    belongs_to :event

    validates :name, :destination_id, :event_id, presence: { message: "must be populated" }, on: :create
    validates_uniqueness_of :user_id, :scope => [:destination_id, :event_id], :message=>"has previously created identical itinerary", on: :create

end
