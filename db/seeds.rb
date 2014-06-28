# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Company.create(name: 'HAM Corporation')
c2 = Company.create(name: 'Google Inc')

u1 = User.create(email: 'jesse@ham.com', password: 'password',
                 password_confirmation: 'password', name: 'Jesse Sessler',
                 goal_description: "Mass protein intake bro", admin: true)
u2 = User.create(email: 'stephen@ham.com', password: 'password',
                 password_confirmation: 'password', name: 'Stephen Marsh',
                 goal_description: "Get totally ripped brah", admin: false)
u3 = User.create(email: 'alex@ham.com', password: 'password',
                 password_confirmation: 'password', name: 'Alexandra Shook',
                 goal_description: "Up my kale intake", admin: false)
u4 = User.create(email: 'jason@ham.com', password: 'password',
                 password_confirmation: 'password', name: 'Jason Leibowitz',
                 goal_description: "Look great naked", admin: false)
u5 = User.create(email: 'paul@ham.com', password: 'password',
                 password_confirmation: 'password', name: 'Paul Lee',
                 goal_description: "Lose weight", admin: false)
u6 = User.create(email: 'spencer@ham.com', password: 'password',
                 password_confirmation: 'password', name: 'Spencer Stebbins',
                 goal_description: "Up my 16-pack to a 20-pack", admin: false)

c1.users << u1 << u2 << u3 << u4 << u5 << u6
