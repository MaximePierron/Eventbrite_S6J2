class Attendance < ApplicationRecord
    validates :stripe_customer_id, presence: true
    
    belongs_to :event
    belongs_to :user
end
