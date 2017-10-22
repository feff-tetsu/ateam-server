class Baggage < ApplicationRecord
    belongs_to :user
    belongs_to :rental_user, optional: true
end
