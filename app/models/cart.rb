class Cart < ApplicationRecord
    belongs_to :user

    has_many :carts_baggages
    has_many :baggages, through: :carts_baggages
end
