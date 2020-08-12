class User < ApplicationRecord
    has_many :itineraries

    has_secure_password

end
