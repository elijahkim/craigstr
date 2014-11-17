# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Region.destroy_all
Category.destroy_all
Post.destroy_all

user = User.create(email: "user@example.com", password_digest: "password")
User.create(email: "admin@example.com", admin: true, password_digest: "password")

region = Region.create(name: "New York")

category = Category.create(name: "Bikes")

Post.create(name: "New Bike", categories: [category], region: region, user: user)
Post.create(name: "Not really a bike", categories: [category], region: region, user: user)
