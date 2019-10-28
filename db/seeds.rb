# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 20.times do
  model = Model.new({name: Faker::Vehicle.model, brand: Faker::Vehicle.make, cc: Faker::Vehicle.engine_size, fuel: Faker::Vehicle.fuel_type, size: ["Small", "Medium", "Large"].sample})
  if model.save
    puts " model created"
  else
    p model.errors.messages
 end
end
