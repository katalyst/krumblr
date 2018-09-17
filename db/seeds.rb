# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(name: "Justin", email: "justin.test@test.com", password: "password")
blog = Blog.create(title: "Justin Music", user_id: user.id)
tag_1 = Tag.create(name: "WOW")
tag_2 = Tag.create(name: "Nice")
tag_3 = Tag.create(name: "Bad")
post_1 = Post.create(title: "Music is music", body: "This is a body", user_id: user.id, tag_ids: [tag_1.id, tag_2.id], blog_id: blog.id)
post_2 = Post.create(title: "Video is video", body: "This is a body", user_id: user.id, tag_ids: [tag_3.id], blog_id: blog.id)