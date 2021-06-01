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
end
