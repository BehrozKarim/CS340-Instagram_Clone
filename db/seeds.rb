require_relative '../lib/populator_fix.rb'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Account.create([
# 	{username: "john", first_name: "John", last_name: "Doe", email:"johndoe@example.com", password: "password"}
# 	{username: "jane", first_name: "Jane", last_name: "Smith", email:"janesmith@example.com", password: "password"}
# 	{username: "susan", first_name: "Susan", last_name: "Baker", email:"susanbaker@example.com", password: "password"}
# ])

# Account.populate 2 do |u|
for u in 0..2000 do
	  Account.create([{username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email, password: "password"}])
	# u.username = Faker::Name.first_name
	# u.first_name = Faker::Name.first_name
	# u.last_name = Faker::Name.last_name
	# u.email = Faker::Internet.email
	# u.encrypted_password = "password"
  end