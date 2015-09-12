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

 # Create Topics
150.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all

 # Create Posts
 5000.times do
   Post.create!(
     user: users.sample,
     topic: topics.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

  # Create Summaries
 10.times do
   Summary.create!(
     post:        posts.sample,
     name:        Faker::Lorem.sentence,
     description: Faker::Lorem.paragraph
   )
 end
summaries = Summary.all

 # Create Comments
 100.times do
   Comment.create!(
     user: users.sample,
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

post = Post.where(title: "Test title",
 body: "some amazing body that meets",
 user: users.sample).first_or_create

 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 member.skip_confirmation!
 member.save!

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
