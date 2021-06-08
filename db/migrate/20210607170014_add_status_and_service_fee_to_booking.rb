class AddStatusAndServiceFeeToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :status, :boolean
    add_column :bookings, :service_fee, :integer
    add_column :bookings, :occupancy_fee, :integer
    add_column :bookings, :cleaning_fee, :integer
  end
end
