class ChangeTypeOfStatus < ActiveRecord::Migration[6.1]
  def change
    change_table :bookings do |t|
      t.change :status, :integer, using: 'status::integer'
    end
    change_table :payments do |t|
      t.change :card_number, :bigint, :limit => 16
      t.change :cvv, :integer, :limit => 3
    end
  end
end
