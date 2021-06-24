class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :card_holder
      t.integer :card_number
      t.string :expiration
      t.integer :cvv

      t.timestamps
    end
  end
end
