class Apartment < ApplicationRecord
  belongs_to :category
  has_many :booking


end
