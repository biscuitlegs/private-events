class User < ApplicationRecord
    has_secure_password
    has_many :created_events, class_name: "Event", foreign_key: "creator_id"
    has_many :attendings, foreign_key: "guest_id"
    has_many :attended_events, through: :attendings
end
