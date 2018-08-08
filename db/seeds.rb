# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#


text_content = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis accumsan magna vel aliquam. In eu libero nunc. ",
  "Ut placerat semper nunc. Suspendisse interdum est nisi, non ornare lorem dictum sit amet. Quisque placerat congue metus, porta condimentum mi. Nam rhoncus urna eget orci eleifend tincidunt. Pellentesque eu metus ac urna tempus hendrerit vitae vel urna. Proin id facilisis erat. Suspendisse id rhoncus ex. Aliquam porttitor velit enim, id feugiat nisl vulputate at. Integer dapibus commodo malesuada. Suspendisse sit amet aliquam tellus. Cras posuere ipsum sed commodo consectetur. Vivamus sagittis lorem vestibulum pretium feugiat.",
  "Fusce commodo lacus id dui consectetur placerat. Nunc ut cursus erat, id blandit leo. Donec id diam ac enim semper tincidunt sed a nibh. Mauris volutpat metus ex. Nunc nisi massa, tristique vel lectus ac, fermentum condimentum justo. Aliquam eu quam arcu. Maecenas vel pulvinar ipsum. Aenean a aliquam eros."
]

blog_names = ["My Awesome Blog", "Kumblr Official", "Regular Gnoll", "Cookie Monster"]

u1 = User.create(email: "sam@sam.com", password: "testpassword")

(0..20).each do |i|
  blog = Blog.where(name: blog_names[i % blog_names.count]).first_or_create
  blog.posts.create(title: "Post #{i}", content: text_content[i % text_content.count])
end
