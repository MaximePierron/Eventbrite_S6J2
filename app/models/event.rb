class Event < ApplicationRecord
    
    validates :start_date, presence: true
    validates :duration, presence: true
    validates :title, presence: true, length:{minimum:10}
    validates :description, presence: true, length:{minimum: 100}
    validates :price, presence: true
    validates :location, presence: true
    
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :user
end
