class Favorite < ApplicationRecord
    has_many :favorite_baggages
    has_many :baggages, through: :favorite_baggages
end
