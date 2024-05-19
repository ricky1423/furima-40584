FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'g9' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    name_first            { person.first }
    name_second           { person.last }
    name_first_kana       { person.first.katakana }
    name_second_kana      { person.last.katakana }
    birth_day             { Faker::Date.backward }
  end
end
