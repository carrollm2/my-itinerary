class User < ApplicationRecord
    has_many :itineraries

    validates :username, presence: true
    validates :email, presence: true
    has_secure_password

end
