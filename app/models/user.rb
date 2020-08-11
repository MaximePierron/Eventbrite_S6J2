class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    has_many :attendances
    has_many :events
    
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    PASSWORD_FORMAT = /\A
        (?=.{8,})          # Must contain 8 or more characters
        (?=.*\d)           # Must contain a digit
        (?=.*[a-z])        # Must contain a lower case character
        (?=.*[A-Z])        # Must contain an upper case character
        (?=.*[[:^alnum:]]) # Must contain a symbol
    /x
    
    validates :first_name,presence: true
    validates :last_name,presence: true
    validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
    validates :encrypted_password, presence: true, format: { with: PASSWORD_FORMAT }
    validates :description, presence: true

    after_create :welcome_send
    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end

    
end
