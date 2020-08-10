class Event < ApplicationRecord
    DATE_FORMAT = /\d{2}\/\d{2}\/\d{4}/
    validates :start_date, presence: true, format: { with: DATE_FORMAT }
    validates :duration, presence: true
    validates : title, length:{minimum:10}
    validates :description, length:{minimum: 100}
    validates :price, presence: true
    validates :location, presence: true
    
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :user
end
