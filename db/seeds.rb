# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "Fakey McUserson",
  email: "fakey@mcuserson.com",
  password: "password",
  password_confirmation: "password",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

99.times do |n|
  name = Faker::Name.name
  password = "password"
  User.create!(
    name: name,
    email: "thing#{n+1}@catsinhats.com",
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end
