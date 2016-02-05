# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.delete_all

user = User.create!(
	firstname: 'Tessa',
	lastname: 'Kruger',
	email: 'tessa@example.com',
	password: '123456',
	password_confirmation: '123456',
	admin: true
	)

50.times do
	user = User.new
	user.firstname = Faker::Name.first_name
	user.lastname = Faker::Name.last_name
	user.email = Faker::Internet.email
	user.password = '123456'
	user.password_confirmation = '123456'
	user.admin = [true, false].sample

	user.save
end