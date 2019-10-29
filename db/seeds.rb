# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 Model.create(
           name: "Vario 125",
           brand: "Honda",
           cc: "125",
           fuel: "gasoline",
           size: "Small")
 Model.create(
           name: "Vario 150",
           brand: "Honda",
           cc: "150",
           fuel: "gasoline",
           size: "Small")
 Model.create(
           name: "Scoopy",
           brand: "Honda",
           cc: "108",
           fuel: "gasoline",
           size: "Small")
 Model.create(
           name: "Nmax",
           brand: "Yamaha",
           cc: "155",
           fuel: "gasoline",
           size: "Medium")
 Model.create(
           name: "CB150",
           brand: "Honda",
           cc: "150",
           fuel: "gasoline",
           size: "Big")
10.times do
 User.create!(email: Faker::Internet.email, password: "password")
end
15.times do
  Scooter.create!(model_id: (1..5).to_a.sample,
  user_id: (1..5).to_a.sample,
  location: "canggu",
  age: (2010..2019).to_a.sample,
  mileage: (1..10000).to_a.sample,
  condition: "Good",
  photo: "https://ik.imagekit.io/hj8sm3kk7/large/gallery/exterior/73/985/honda-scoopy-esp-left-side-view-full-image-128865.jpg",
  price_per_day: (20000..80000).to_a.sample)
end

