Admin = Admin.create_with(password: 'admin123', password_confirmation: 'admin123').find_or_create_by(email: 'admin@test.com')
