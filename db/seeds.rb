# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# AdminUser.create!(email: 'admin2@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# ActiveRecord::Base.transaction do

#   50.times do |i|
#     puts  "User #{i+1} created Successfully"
#     user = User.create(
#       email: Faker::Internet.email,
#       password: '111111',
#       role: User::ROLE.sample
#       )


#     puts "Event #{i+1} created Successfully."
#     event = Event.create(
#       title: Faker::Lorem.word,
#       description: Faker::Lorem.paragraph_by_chars(number: 250) ,
#       location: Faker::Address.city ,
#       date: Faker::Date.between(from: '2024-09-23', to: '2024-09-25'),
#       time:  Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#       ticket_price:  Event::TICKET_PRICE.sample,
#       available_ticket: Random.rand(20),
#       )

#       puts "Booking #{i+1} created Successfully."
#       Booking.create(user_id: user.id, event_id: event.id)
#   end

# end

# users = User.all
# users.each do |user|
#   user.update(role: User::ROLE.sample)
# end