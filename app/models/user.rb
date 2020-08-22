class User < ApplicationRecord
    has_many :itineraries
    has_many :events, through: :itineraries
    has_many :destinations, through: :itineraries

    has_secure_password


    validates :username, :email, presence: { message: "must be populated" }, on: :create
    validates :username, :email, uniqueness: { message: "previously used by another user. Please choose a different %{attribute}" }, on: :create

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, on: :create

    validates :password, :length => { :in => 6..40 }, on: :create

    validate :password_complexity, on: :create

    validates_confirmation_of :password

    def password_complexity
        return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/
    
        errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    end    

end
