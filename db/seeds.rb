# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(username: "User1", password: "Pass1")

b1 = Blog.create(blogname: "Star Wars", user_id: u1.id)
b2 = Blog.create(blogname: "Lord of the Rings", user_id: u1.id)

p1 = Post.create(title: "Hello there", text: "General Kenobi", blog_id: b1.id)
p2 = Post.create(title: "I have the high ground", text: "You underestimate my power", blog_id: b1.id)
p3 = Post.create(title: "Big plot hole", text: "Why didn't the Council of Elrond use the eagles", blog_id: b2.id)