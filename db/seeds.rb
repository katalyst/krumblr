# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(email: "u1@foo", password: "12341234")
u2 = User.create(email: "u2@bar", password: "qwerqwer")

b1 = Blog.create(text: "This is my long winded opinion about League of Legends...", user: u1)
b2 = Blog.create(text: "This is what I think about Rocket League...", user: u2)

p1 = Post.create(body: "LoL is cool, I main Ahri!", blog: b1, user: u1)
p2 = Post.create(body: "Darius is broken!", blog: b1, user: u2)
p3 = Post.create(body: "Psyonix are a great company!", blog: b2, user: u1)

l1 = Like.create(post: p1, user: u1)
