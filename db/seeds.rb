# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb



puts 'Destroying existing records...'
Storing.destroy_all
Score.destroy_all
User.destroy_all

# Helper method to generate fake users
def create_fake_user
  User.create(
    email: Faker::Internet.email,
    password: 'password', # You can customize the password if needed
    # Add any other attributes you want to generate with Faker
  )
end

# Create 10 fake users
puts 'Creating users...'
10.times do
  create_fake_user
end

# Create 10 scores with dummy data
puts 'Creating scores...'
scores_created = 0

10.times do
  score = Score.create(
    name: Faker::Lorem.word,
    scorepdf: Faker::Lorem.word,
    user: User.all.sample,
    scoretype: Faker::Lorem.word,
    copmoser: Faker::Lorem.word,
    arranger: Faker::Lorem.word,

  )
  scores_created += 1 if score.persisted?
  puts 'Creating storing...'

  # Create a random number of storings (between 1 and 5) for each score
  rand(1..5).times do
    Storing.create(
      user: User.all.sample, # Assign a random user to each storing
      score: Score.all.sample
    )
  end
  puts "#{scores_created} Scores created."

end

puts 'Seeding completed!'
