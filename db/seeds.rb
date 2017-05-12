# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


usernames = []
20.times do
  usernames.push(Faker::Internet.user_name)
end

200.times do
  username = usernames.sample

  Transfer.create({username: username, amount: rand(50..500)})
end
