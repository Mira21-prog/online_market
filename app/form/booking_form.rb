class BookingForm
  include ActiveModel::Model

  validates :checkin, :checkout, :price, :adult, :children, :infans,
            :apartment, :user, presence: true
            
  include ActiveAttr::MassAssignment
  attr_accessor :checkin, :checkout, :price, :adult, :children, :infans,
                :apartment, :user
end
