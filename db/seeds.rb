if Rails.env.development?
  devs = [
    { username: 'tyler', email: 'tyler.vannurden@gmail.com' }
  ]

  devs.each do |dev|
    admin = User.find_or_create_by(username: dev[:username]) do |admin|
      admin.email = dev[:email]
      admin.is_admin = true
      admin.password = 'password'
      admin.password_confirmation = 'password'
      admin.skip_confirmation!
    end

    if admin.username == 'tyler'
      admin.accounts.create!(
        name: 'Tyler VanNurden, LLC',
        billing_address: '2735 Darley Ave',
        billing_city: 'Boulder',
        billing_state: 'CO'
      )
    end
  end
end
