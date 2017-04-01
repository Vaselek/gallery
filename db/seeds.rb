# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Asel", email: "asel@mail.ru", password: "jkljkl", admin: true)

fixtures_path = Rails.root.join('app', 'assets', 'images')

9.times do |n|
  name  = Faker::Name.name
  password = Faker::Internet.password
  email = Faker::Internet.email
  User.create!(name:  name, password: password, email: email)
end

users = User.all

1.upto 10 do |i|
  users.each do |user|
    user.images.create!(title: "some title", file: File.new(fixtures_path.join(i.to_s + ".jpg")))
  end
end

1.upto 9 do |i|
  Commentary.create!(
    content: Faker::Name.name,
    user_id: i,
    image_id: i+1,
    grade: rand(1..5))
end

