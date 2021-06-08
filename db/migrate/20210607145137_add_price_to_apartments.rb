class AddPriceToApartments < ActiveRecord::Migration[6.1]
  def change
    add_column :apartments, :price, :integer
  end
end
