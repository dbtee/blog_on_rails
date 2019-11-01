
Comment.destroy_all
Post.destroy_all
User.destroy_all


PASSWORD = "wew"

super_user = User.create(
  name: "lad",
  email: "nice@meme.gov",
  password: PASSWORD,
  is_admin: true
)
10.times do
  name = Faker::Movies::LordOfTheRings.character
  User.create(
    name: name,
    email: "#{name.downcase}@#{Faker::Movies::LordOfTheRings.location}.com",
    password: PASSWORD
  )
end

users = User.all

200.times do
  created_at = Faker::Date.backward(days: 365)
  p = Post.create(
    # Faker is a ruby module. We access classes or
    # other modules inside of a module with the
    # `::` syntax. Here Hacker is a class within
    # the Faker module.
    title: Faker::Quote.famous_last_words,
    body: Faker::TvShows::GameOfThrones.quote,
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
  )
  if p.valid?
    p.comments = rand(0..15).times.map do
      Comment.new(body: Faker::GreekPhilosophers.quote,
      user: users.sample
      )
    end
  end
end


post = Post.all
comment = Comment.all

puts Cowsay.say("Generated #{Post.count} posts", :frogs)
puts Cowsay.say("Generated #{comment.count} comments", :tux)
puts Cowsay.say("Created #{users.count}, users", :tux)
puts "Login with #{super_user.email} and password of '#{PASSWORD}'"