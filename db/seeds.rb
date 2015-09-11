require 'faker'

# Create Posts
50.times do
    Post.create!(
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph
        )
end
posts = Post.all

# Create Comments
100.times do
    Comment.create!(
        post: posts.sample,
        body: Faker::Lorem.paragraph
        )
end

# assignment 32 seed data 
Post.find_or_create_by!(
 	title: "Sample post title",
 	body: "This is my sample post body"
 	)

 Comment.find_or_create_by!(
 	post: posts.sample, 
 	body: "This is my sample comment body"
 	)



puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"


