# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Event.destroy_all

20.times do 
	
	user = User.create!(
            first_name: Faker::Name.first_name,
		    last_name: Faker::Name.last_name,
            description: Faker::Movie.quote,
            email: "#{Faker::Name.first_name}@yopmail.com",
            password: "Doodledee@23")
	puts "User added"

	2.times do
		@event = Event.create!(
            start_date: Faker::Date.in_date_period(year: 2021),
            duration: rand(30..120),
            title: Faker::ChuckNorris.fact,
            description: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: true),
            price: rand(15..55),
            location: Faker::Address.city,
            user: user,
            user_id: user.id)
		puts "Event added"
	end

end