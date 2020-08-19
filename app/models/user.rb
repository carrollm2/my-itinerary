class User < ApplicationRecord
    has_many :itineraries
    has_many :events, through: :itineraries
    has_many :destinations, through: :itineraries


    validates :username, presence: true
    validates :email, presence: true
    has_secure_password

end
