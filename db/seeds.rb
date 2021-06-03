require 'csv'

csv_data = File.read(Rails.root.join('db/apartment.csv').to_s)

csv = CSV.new(csv_data, headers: true, header_converters: :symbol, converters: :all)

products_data = csv.to_a.map { |row| row.to_hash }

products_data.each do |item|
  category = Category.where(name: item[:category].strip).first_or_create!

  subcategory = category.subcategories.where(parent_id: category.id, name: item[:subcategory].strip).first_or_create!
  product = subcategory.apartments.create(name: item[:name], address: item[:address],
                                        characteristic: item[:characteristic],
                                        phone_number: item[:phone_number],
                                        email: item[:email])

end
