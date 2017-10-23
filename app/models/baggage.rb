class Baggage < ApplicationRecord
    belongs_to :user
    belongs_to :rental_user, optional: true

    has_many :carts_baggages
    has_many :carts, through: :carts_baggages

    has_attached_file :image, 
    :path => ":attachment/:id/:style.:extension",
    styles: { medium: "680x300>", thumb: "170x75>" }, 
    default_url: "/images/:style/missing.png" 

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/ #
end
