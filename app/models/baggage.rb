class Baggage < ApplicationRecord
    belongs_to :user
    belongs_to :rental_user, optional: true

    has_many :carts_baggages
    has_many :carts, through: :carts_baggages
end
