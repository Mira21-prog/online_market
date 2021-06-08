class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :checkin
      t.date :checkout
      t.integer :adult
      t.integer :children
      t.integer :infans
      t.integer :total
      t.belongs_to :apartment, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
