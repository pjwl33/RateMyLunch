# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Company.create(name: 'HAM Corporation')
c2 = Company.create(name: 'Google Inc')

u1 = User.create(email: 'jesse@ham.co', password: 'password',
                 password_confirmation: 'password', name: 'Jesse Sessler',
                 goal_description: "Mass protein intake bro", admin: true)
u2 = User.create(email: 'stephen@ham.co', password: 'password',
                 password_confirmation: 'password', name: 'Stephen Marsh',
                 goal_description: "Get totally ripped brah", admin: false)
u3 = User.create(email: 'alex@ham.co', password: 'password',
                 password_confirmation: 'password', name: 'Alexandra Shook',
                 goal_description: "Up my kale intake", admin: false)
u4 = User.create(email: 'jason@ham.co', password: 'password',
                 password_confirmation: 'password', name: 'Jason Leibowitz',
                 goal_description: "Look great naked", admin: false)
u5 = User.create(email: 'paul@ham.co', password: 'password',
                 password_confirmation: 'password', name: 'Paul Lee',
                 goal_description: "Lose weight", admin: false)
u6 = User.create(email: 'spencer@ham.co', password: 'password',
                 password_confirmation: 'password', name: 'Spencer Stebbins',
                 goal_description: "Up my 16-pack to a 20-pack", admin: false)

c1.users << u1 << u2 << u3 << u4 << u5 << u6

g1 = Goal.create(name: 'Lose Weight', desc: 'Meals that encourage weight loss')
g2 = Goal.create(name: 'Eat Healthy', desc: 'Well-balanced meals that hit all of the major food groups')
g3 = Goal.create(name: 'Gain Muscle', desc: 'High protein, lean meals to help build muscle')

file1 = File.open("/Users/jemise111/Desktop/Media/sessler_pic2.jpg")
file2 = File.open("/Users/jemise111/Desktop/Media/photostrip.jpg")
file3 = File.open("/Users/jemise111/Desktop/Media/PA070001.JPG")

users = [u1, u2, u3, u4, u5, u6]

10.times do |i|
 Meal.create(comment: "Healthy Meal #{i}", ingredients: 'tomato, salad', user_id: users[i % 6], goal_id: g1.id, meal_photo: file1)
end

10.times do |i|
 Meal.create(comment: "Healthy Meal #{i}", ingredients: 'cucumber, salad', user_id: users[i % 6], goal_id: g2.id, meal_photo: file2)
end

10.times do |i|
 Meal.create(comment: "Healthy Meal #{i}", ingredients: 'carrots, salad', user_id: users[i % 6], goal_id: g3.id, meal_photo: file3)
end

Meal.all.each do |meal|
 5.times do |i|
   rating = rand(i)
   Rating.create(vote_rating: rating, user_id: i.next, meal_id: meal.id)
 end
end

Meal.all.each do |meal|
 Company.find_by(name: "HAM Corporation").meals << meal
end