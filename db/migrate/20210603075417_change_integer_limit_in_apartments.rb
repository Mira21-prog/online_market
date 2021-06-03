class ChangeIntegerLimitInApartments < ActiveRecord::Migration[6.1]
  def change
    change_column :apartments, :phone_number, :integer, limit: 8
  end
end
