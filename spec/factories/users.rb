FactoryBot.define do
  factory :buyer do
    sequence(:email) { |n| "testssss-#{n.to_s.rjust(3, "0")}@sample.com" }
    first_name { "John" }
    last_name { "Doe" }
    phone_number { (0..10).map{rand(0..10)}.join }
    password { 'password' }
    password_confirmation { 'password' }
    type {'Buyer'}
  end

  factory :booking do
    checkin { "12/10/2020" }
    checkout { "16/12/2020" }
    adult { 1 }
    children { 1 }
    infans { 1 }
    total { 1601 }
    association :apartment
    association :user_id, factory: :buyer
    status { "paid" }
    service_fee { 100 }
    occupancy_fee { 300 }
    cleaning_fee { 200 }
    payment_id { nil}
    night { 10 }
    trait :invalid do
      checkin nil
      checkout nil
      adult nil
      children nil
      infans nil
      total nil
      association nil
      association nil
      status nil
      service_fee nil
      occupancy_fee nil
      cleaning_fee nil
      payment_id nil
      night nil
    end
  end

  factory :apartment do
    name { "iyIKHiPssRqdD"}
    address { "17 Mechanisc Street Calhoun, GA 30701" }
    characteristic { "Totsam officiis ad. Rerum incidunt quis. Dolorem la..." }
    phone_number { 8828288282822882 }
    email { "iyIKHiPRqddD@gmail.com" }
    association :category, factory: :category
    price { 100 }
  end

  factory :category do
    name { "Taormina" }
    parent_id { nil }
  end
end
