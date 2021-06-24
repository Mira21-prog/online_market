class Booking < ApplicationRecord
  belongs_to :buyer, foreign_key: :user_id
  belongs_to :apartment
  has_many :payments
  enum status: [ :paid, :unpaid ]
end
