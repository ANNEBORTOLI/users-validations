require 'faker'

puts "🧹Cleaning database..."
User.destroy_all

puts "🌱 Seeding..."
puts "👩‍👩‍👦‍👦 Creating users..."

20.times do |n|
  User.create!(
    name: "#{Faker::Name.name}-#{n}",
    email: "#{Faker::Internet.email}",
    cpf: "#{CPF.generate(true)}",
    phone: Faker::Base.numerify('(##) ####-####')
  )
end

20.times do |n|
  User.create!(
    name: "#{Faker::Name.name}-#{n}",
    email: "#{Faker::Internet.email}",
    cpf: "#{CPF.generate(true)}",
    phone: Faker::Base.numerify('(##) #####-####')
  )
end

puts '🌟Finished!'
