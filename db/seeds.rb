# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.new(forename: "Bart", 
         surname: "Conure", 
         username: "bartrules", 
         email: "bart@notadomain.com", 
         password: "password1", 
         profilePic: "").save

Post.new(content: "Wow awesome!",
         user_id: 1).save

Like.new(user_id: 1, 
         post_id: 1).save
