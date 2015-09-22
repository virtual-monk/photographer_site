# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(category: "Special Occasion")
Category.create(category: "Wedding/Engagement")
Category.create(category: "Portrait")
Category.create(category: "Nature")
Category.create(category: "Product/food")
Category.create(category: "Stylistic")
Category.create(category: "Videographer")
Category.create(category: "Sports/action")
Category.create(category: "Real Estate")
Category.create(category: "Photo Journalist")
Category.create(category: "Boudoir")

Profile.create(first_name: "Robert", last_name: "Monk",
 location: "New Orleans, La", years_experience: 4, user_id: 6)
Profile.create(first_name: "Tim", last_name: "Crane",
 location: "Boston, Ma", years_experience: 2, user_id: 12)
Profile.create(first_name: "Sara", last_name: "Thompson",
 location: "Seattle, Wa", years_experience: 9, user_id: 13)
Profile.create(first_name: "Mike", last_name: "Hizate",
 location: "Autin, Tx", years_experience: 7, user_id: 14)
Profile.create(first_name: "Carlos", last_name: "James",
 location: "Mobile, Al", years_experience: 5, user_id: 5)
