# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.destroy_all
Post.destroy_all

200.times do
  created_at = Faker::Date.backward(365 * 5)
  p = Post.create(
    # Faker is a ruby module. We access classes or
    # other modules inside of a module with the
    # `::` syntax. Here Hacker is a class within
    # the Faker module.
    title: Faker::Hacker.say_something_smart,
    body: Faker::ChuckNorris.fact,
    created_at: created_at,
    updated_at: created_at
  )
  if p.valid?
    p.comments = rand(0..15).times.map do
      Comment.new(body: Faker::GreekPhilosophers.quote)
    end
  end
end


post = Post.all
comment = Comment.all

puts Cowsay.say("Generated #{Post.count} posts", :frogs)
puts Cowsay.say("Generated #{comment.count} comments", :tux)