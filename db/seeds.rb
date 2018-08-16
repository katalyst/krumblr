# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

user_cookiemonster = User.create(email: "cookie@monster.com", password: "cookies")
blog_cookiemonster = Blog.create(user: user_cookiemonster, name: "Cookie Monster")

posts_cookiemonster = [
  {blog: blog_cookiemonster, tag_string: "#cookies #coolAsACumber #food", title: "Now what starts with C?", content: "Cucumber, but it not as cool as a cookie"},
  {blog: blog_cookiemonster, tag_string: "#cookies #vegatables #food", title: "Now what starts with C?", content: "Carrot, but it not as crunchy as a cookie"},
  {blog: blog_cookiemonster, tag_string: "#cookies #meta", title: "Now what starts with C?", content: "Catalyst, but not as tasty"},
  {blog: blog_cookiemonster, tag_string: "#cookies #dbz #ssj4 #kamehameha #ki #blast", title: "Now what starts with C?", content: "Kakarot, ... is a Super Saiyan"},
  {blog: blog_cookiemonster, tag_string: "#cookies", title: "Now what starts with C?", content: "Cookie! Cookie starts with C"},
  {blog: blog_cookiemonster, tag_string: "#cookies #yummy", title: "Om nom nom nom", content: "Om nom nom *munch munch* nom nom nom"}
]

user_cr = User.create(email: "critical@role.com", password: "dnd4lyfe")
blog_cr = Blog.create(user: user_cr, name: "DnD: Players Handbook")

posts_cr = [
  {blog: blog_cr, tag_string: "#DnD", title: "Spell: Acid Arrow", content: "A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn."},
  {blog: blog_cr, tag_string: "#DnD #coolAsACumber #ghost", title: "Spell: Chill Touch", content: "You create a ghostly, skeletal hand in the space of a creature within range. Make a ranged spell attack against the creature to assail it with the chill of the grave. On a hit, the target takes 1d8 necrotic damage, and it can’t regain hit points until the start of your next turn. Until then, the hand clings to the target. If you hit an undead target, it also has disadvantage on attack rolls against you until the end of your next turn."},
  {blog: blog_cr, tag_string: "#DnD #lightUpYourLife", title: "Spell: Dancing Lights", content: "You create up to four torch-sized lights within range, making them appear as torches, lanterns, or glowing orbs that hover in the air for the duration. You can also combine the four lights into one glowing vaguely humanoid form of Medium size. Whichever form you choose, each light sheds dim light in a 10-foot radius."},
  {blog: blog_cr, tag_string: "#DnD #kamehameha #blast",title: "Spell: Eldritch Blast", content: "A beam of crackling energy streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 force damage. The spell creates more than one beam when you reach higher levels: two beams at 5th level, three beams at 11th level, and four beams at 17th level. You can direct the beams at the same target or at different ones. Make a separate attack roll for each beam."},
  {blog: blog_cr, tag_string: "#DnD #", title: "Spell: Fire Bolt", content: "You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn’t being worn or carried."},
  {blog: blog_cr, tag_string: "#DnD #guidance", title: "Spell: Guidance", content: "You touch one willing creature. Once before the spell ends, the target can roll a d4 and add the number rolled to one ability check of its choice. It can roll the die before or after making the ability check. The spell then ends."}
]

user_sam = User.create(email: "sam@sam.com", password: "samsam")
blog_sam = Blog.create(user: user_sam, name: "Sam I Am")
posts_sam = [
  {blog: blog_sam, tag_string: "#sam #treasureIsland", title: "Sam the Eagle", content: "Yes! This is most trustworthy life boat"},
  {blog: blog_sam, tag_string: "#sam #itsYourSam #theBrace #potatoes #vegatables", title: "Samwise Gamgee", content: "I swear, I ain't be dropping no eaves"},
  {blog: blog_sam, tag_string: "#sam ", title: "Yosemite Sam", content: "Gosh tarn it!  Get back here rabbit!"},
  {blog: blog_sam, tag_string: "#sam #goodDoggy", title: "Sam Sheepdog", content: "Mornin' Ralph!"},
  {blog: blog_sam, tag_string: "#sam #food", title: "I am Sam", content: "Green Eggs With Ham"},
  {blog: blog_sam, tag_string: "#sam #ghost #", title: "Sam Wheat", content: "Ditto!"}
]

(0..5).each do |index|
  Post.create(posts_cookiemonster[index])
  Post.create(posts_cr[index])
  Post.create(posts_sam[index])
end
