class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :address
      t.string :characteristic
      t.integer :phone_number
      t.string :email
      t.integer :category_id
      t.timestamps
    end
  end
end
