# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  admin = User.find_or_create_by(username: 'admin') do |admin|
    admin.email = 'admin@fmadata.com'
    admin.is_admin = true
    admin.password = 'password'
    admin.password_confirmation = 'password'
  end
  admin.confirm

  ContactRequest.create(
    email_address: 'hello@test.com',
    name: 'John Doe',
    telephone: '1231231234',
    comments: 'Hello'
  )

  OptOutRequest.create(
    name: 'John Doe',
    request_type: 'opt_out',
    street_address: '2575 Pearl St, Ste 230',
    city: 'Boulder',
    postal_code: '80302',
    state: 'CO'
  )
end
