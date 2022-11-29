FactoryBot.define do
  factory :ngo do
    name { "MyString" }
    description { "MyString" }
    cnpj { "12345678901234" }
    website { "MyString" }
    verified { false }
    street { "MyString" }
    number { 1 }
    district { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
    email { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
    phone_number {"48988437939"}
  end
end
