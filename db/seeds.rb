# ActiveRecord::Base.transaction do

  # 50.times do |i|
  #   puts  "User #{i+1} created Successfully"
  #   user = User.create(
  #     email: Faker::Internet.email,
  #     full_name: Faker::Name.name,
  #     contact_number: Faker::PhoneNumber.phone_number_with_country_code,
  #     password: '111111',
  #     role: User::ROLE.sample
  #     )


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

# users = User.all
# users.each do |user|
#   user.update(full_name: Faker::Name.unique.name)
# end

# users = User.all
# users.each do |user|
#   user.update(contact_number: Faker::PhoneNumber.phone_number_with_country_code)
# end