require 'faker'

puts "Cleaning database..."

User.destroy_all

puts "Creating users..."

10.times do |a|
  User.create!()
end
