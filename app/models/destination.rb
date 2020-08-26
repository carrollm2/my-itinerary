class Destination < ApplicationRecord
    has_many :itineraries
    has_many :events
    has_many :users, through: :itineraries

    validates_uniqueness_of :city, :case_sensitive => false, :message => "already exists in database", on: :create

    @city_regex = /[^,]*,[^,]*/
    validates :city, 
        :format => { :with => @city_regex, :message => "Invalid city format. Must be 'city, state' format" }

end
