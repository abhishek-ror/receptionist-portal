# frozen_string_literal: true

if Rails.env.development?
  User.create!(first_name: "Abhishek", last_name:"Pal", email: 'dev.abhi@yopmail.com', 
  	password: 'password', password_confirmation: 'password')
end
