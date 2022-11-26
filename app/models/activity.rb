class Activity < ApplicationRecord
    has_many :ngo_activities
    has_many :ngos, through: :ngo_activities

    validates :name, presence: true
end
