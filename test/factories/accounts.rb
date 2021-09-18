FactoryBot.define do
  factory :account do
    name { "MyString" }
    telephone { "MyString" }
    telephone_country_code { "MyString" }
    billing_address { "MyString" }
    billing_city { "MyString" }
    billing_state { "MyString" }
    billing_country_code { "MyString" }
  end
end
