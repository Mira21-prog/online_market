class Payment < ApplicationRecord
  belongs_to :booking
  validates :card_holder, :cvv, :card_number, :expiration, presence: true
  validates :cvv, length: { is: 3 }, numericality: { only_integer: true }
  validates :card_number, length: { is: 16 }, numericality: { only_integer: true }
end
