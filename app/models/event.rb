class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :attendings
    has_many :guests, through: :attendings
end
