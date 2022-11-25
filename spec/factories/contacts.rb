FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber::phone_number }
    cellphone { Faker::PhoneNumber::phone_number }
    instagram { Faker::Internet.username }
    ngo
  end
end
