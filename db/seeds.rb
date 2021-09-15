if Rails.env.development?
  devs = [
    { username: 'tyler', email: 'tyler.vannurden@gmail.com' }
  ]

  User.destroy_all

  devs.each do |dev|
    admin = User.find_or_create_by(username: dev[:username]) do |admin|
      admin.email = dev[:email]
      admin.is_admin = true
      admin.password = 'password'
      admin.password_confirmation = 'password'
      admin.skip_confirmation!
    end

  end
end
