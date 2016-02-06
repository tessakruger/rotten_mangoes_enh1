# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.delete_all
Movie.delete_all

user = User.create!(
	firstname: 'Tessa',
	lastname: 'Kruger',
	email: 'tessa@example.com',
	password: '123456',
	password_confirmation: '123456',
	admin: true
	)

user2 = User.create!(
	firstname: 'T',
	lastname: 'K',
	email: 'tessa2@example.com',
	password: '123456',
	password_confirmation: '123456',
	admin: false
	)

40.times do
	user = User.new
	user.firstname = Faker::Name.first_name
	user.lastname = Faker::Name.last_name
	user.email = Faker::Internet.email
	user.password = '123456'
	user.password_confirmation = '123456'
	user.admin = [true, false].sample

	user.save
end

User.all.each do |u|
  2.times do
    title = Faker::Book.title
    director = Faker::Name.name
    runtime_in_minutes = rand(45..180)
    description = Faker::Hipster.paragraph
    poster_image_url = ["http://lorempixel.com/150/150/abstract", "http://lorempixel.com/150/150/sports", "http://lorempixel.com/150/150/cats"].sample
    release_date = Faker::Date.backward(600)

    u.movies.create!(
      title: title,
      description: description,
      director: director,
      poster_image_url: poster_image_url,
      runtime_in_minutes: runtime_in_minutes,
      release_date: release_date
    )
  end
end
