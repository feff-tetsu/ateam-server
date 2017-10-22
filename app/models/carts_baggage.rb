class CartsBaggage < ApplicationRecord
    belongs_to :cart
    belongs_to :baggage
end
