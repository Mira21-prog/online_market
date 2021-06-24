class AddNightToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :night, :integer
  end
end
