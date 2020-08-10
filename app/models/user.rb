class User < ApplicationRecord
    PASSWORD_FORMAT = /\A
        (?=.{8,})          # Must contain 8 or more characters
        (?=.*\d)           # Must contain a digit
        (?=.*[a-z])        # Must contain a lower case character
        (?=.*[A-Z])        # Must contain an upper case character
        (?=.*[[:^alnum:]]) # Must contain a symbol
    /x
    validates :encrypted_password,presence: true,format: { with: PASSWORD_FORMAT }
    validates :first_name,presence: true
    validates :last_name,presence: true
    validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
    validates :description, presence: true


    has_many :attendances
    has_many :events
end
