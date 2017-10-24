class FavoriteBaggage < ApplicationRecord
    belongs_to :favorite
    belongs_to :baggage
end
