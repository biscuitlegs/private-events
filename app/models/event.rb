class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :attendings
    has_many :guests, through: :attendings

    scope :past, -> { where("date < ?", Time.now.strftime("%Y-%m-%d")) }
    scope :upcoming, -> { where("date > ?", Time.now.strftime("%Y-%m-%d")) }
end
