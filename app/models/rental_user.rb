class RentalUser < ApplicationRecord
    has_many :baggages
    belongs_to :user
end
