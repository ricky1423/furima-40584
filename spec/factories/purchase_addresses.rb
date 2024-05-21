FactoryBot.define do
  factory :purchase_address do
    post_code         { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    city              { Faker::Address.city }
    street            { Faker::Address.street_address }
    building_name     { Faker::Address.street_address }
    phone_number      { Faker::Number.decimal_part(digits: rand(10..11)) }
    token             { Faker::Alphanumeric.alphanumeric(number: 30) }
  end
end
