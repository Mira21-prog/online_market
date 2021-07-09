FactoryBot.define do
  factory :buyer do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
    first_name { "John" }
    last_name { "Doe" }
    phone_number { (0..10).map{rand(0..10)}.join }
    password { 'password' }
    password_confirmation { 'password' }
    type {'Buyer'}
  end

  factory :apartment do
    name {|n| "test-#{n.to_s.rjust(3, "0")}-apartment"}
    address {|n| "test-address-#{n.to_s.rjust(3, "0")}"}
    characteristic {"Bla bla bla"}
    phone_number { (0..10).map{rand(0..10)}.join }
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
    category_id { Category.create(name: "Test Category").id }
  end
end
