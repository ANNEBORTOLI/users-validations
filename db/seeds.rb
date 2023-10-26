require 'faker'

puts "🧹Cleaning database..."
User.destroy_all

puts "🌱 Seeding..."
puts "👩‍👩‍👦‍👦 Creating users..."

# Landline
20.times do |n|
  User.create!(
    name: "#{Faker::Name.unique.name}",
    email: "#{Faker::Internet.email}",
    cpf: "#{CPF.generate(true)}",
    phone: Faker::Base.numerify('(##) 9###-####')
  )
end

# Cellphone
20.times do |n|
  User.create!(
    name: "#{Faker::Name.unique.name}",
    email: "#{Faker::Internet.email}",
    cpf: "#{CPF.generate(true)}",
    phone: Faker::Base.numerify('(##) 3###-####')
  )
end

puts '🌟Finished!'
