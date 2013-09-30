# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Project.destroy_all

user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, password: "password")

50.times do |i|
  project1 = user.projects.create!(title: "Project #{i}", teaser: Faker::Company.bs,
    description: "description #{i}", goal: 13000)
end