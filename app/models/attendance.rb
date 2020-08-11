class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :user
    
    validates :stripe_customer_id, presence: true
    
    
end
