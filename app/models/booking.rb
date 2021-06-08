class Booking < ApplicationRecord
  belongs_to :buyer, foreign_key: :user_id
  belongs_to :apartment
  enum status: [ :paid, :unpaid ]
end
