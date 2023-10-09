require 'faker'

puts "🧹Cleaning database..."
User.destroy_all

puts "🌱 Seeding..."
puts "👩‍👩‍👦‍👦 Creating users..."

10.times do |n|
  User.create!(
    name: "#{Faker::Name.name}-#{n}",
    email: "#{Faker::Internet.email}",
    cpf: "#{CPF.generate(true)}",
    phone: Phonelib.parse(Faker::PhoneNumber.cell_phone).e164
  )
end

puts '🌟Finished!'
