# We use factory for users due to error in loading fixtures
# because we do not have email field in database.
# Instead we use virtual email attribute, check the model.
FactoryBot.define do
  factory :contact_request do
    name { Faker::Name.name[0..15] }
    email_address { Faker::Internet.email }
    telephone { Faker::PhoneNumber.phone_number }
    comments { Faker::Lorem.sentence }
  end
end
