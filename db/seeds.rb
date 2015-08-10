 require 'faker'

 # Create Users
 5.times do
   user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.email
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all


 # Create Posts
 50.times do
   Post.create!(
     user: users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
    # user: users.sample,   # we have not yet associated Users with Comments
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

post = Post.where(title: "Test title",
 body: "some amazing body that meets",
 user: users.sample).first_or_create

 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'dom@jackrabbitsystems.com',
   password: 'helloworld'
 )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
