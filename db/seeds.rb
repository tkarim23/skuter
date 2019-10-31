require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# MODELS

puts "Seeding Models"

Model.create(
           name: "Vario 125",
           brand: "Honda",
           cc: "125",
           fuel: "gasoline",
           size: "Small",
           description: "It is undeniable that the latest Honda Vario 150 is one of the best-selling motorcycles in Indonesia. Looking at data from the Indonesian Motorcycle Industry Association (AISI), sales figures reached 238,786 units during the first semester of 2018.",
           photo_url: "https://images.unsplash.com/photo-1527537232679-89f0d63ea3f7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" )
 Model.create(
           name: "Vario 150",
           brand: "Honda",
           cc: "150",
           fuel: "gasoline",
           size: "Small",
           description: "It is undeniable that the latest Honda Vario 150 is one of the best-selling motorcycles in Indonesia. Looking at data from the Indonesian Motorcycle Industry Association (AISI), sales figures reached 238,786 units during the first semester of 2018.",
           photo_url: "https://images.unsplash.com/photo-1560167803-3b2eb072d10a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80")
 Model.create(
           name: "Scoopy",
           brand: "Honda",
           cc: "108",
           fuel: "gasoline",
           size: "Small",
           description: "Honda Scoopy is a trademark of scooter motorcycles manufactured by Astra Honda Motor. This motorcycle was launched in 2010. The motorbike, which was launched in 2010, is intended to anticipate the growing popularity of automatic scooters in the Indonesian motorcycle market. Honda Scoopy will compete directly with Yamaha Xeon, Suzuki Spin, Honda Beat, Honda Vario Suzuki Hayate and Yamaha Fino.",
           photo_url: "https://images.unsplash.com/photo-1457076098342-5ce69fc59d33?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1558&q=80")
 Model.create(
           name: "Nmax",
           brand: "Yamaha",
           cc: "155",
           fuel: "gasoline",
           size: "Medium",
           description: "Yamaha Nmax ABS is the best choice of automatic scooters today with advanced features and technology. Feel the experience of driving with Yamaha",
           photo_url: "https://images.unsplash.com/photo-1452500750497-8f858eda4c77?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80")
 Model.create(
           name: "CB150",
           brand: "Honda",
           cc: "150",
           fuel: "gasoline",
           size: "Big",
           description: "The Honda CB150R StreetFire is a CB series 150 cc single-cylinder standard/naked bike made by Astra Honda Motor in Indonesia since late 2012. It is positioned above the more economical Verza in Astra Honda Motor's sport motorcycles lineup.",
           photo_url: "https://images.unsplash.com/photo-1502744688674-c619d1586c9e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80")
  Model.create(
           name: "Classic",
           brand: "Vespa",
           cc: "150",
           fuel: "gasoline",
           size: "Medium",
           description: "Vespa is an Italian brand of scooter manufactured by Piaggio. The name means wasp in Italian. The Vespa has evolved from a single model motor scooter manufactured in 1946 by Piaggio & Co. S.p.A. of Pontedera, Italy to a full line of scooters and one of seven companies today owned by Piaggio.",
           photo_url: "https://images.unsplash.com/photo-1503434396599-58ba8a18d932?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80")

puts "seeding Models - Complete"

# USERS
puts "seeding Users"

10.times do
 User.create!(
  email: Faker::Internet.email,
  password: "password",
  introdution: "#{Faker::Quote.most_interesting_man_in_the_world}. #{Faker::Quote.most_interesting_man_in_the_world}",
  name:Faker::Books::Dune.character,
  location:["canggu", "london", "madrid", "paris", "singapore", "beijing", "tokyo", "barcelona", "mumbai", "berlin", "Valence", "Rome"].sample,
  photo:"photo.jpg"
  )
end

puts "seeding Users - Complete!"

# SCOOTERS
puts "seeding Scooters"

50.times do
  scooter = Scooter.new(model: Model.all.sample,
  user: User.all.sample,
  location: ["canggu", "london", "madrid", "paris", "singapore", "beijing", "tokyo", "barcelona", "mumbai", "berlin", "Valence", "Rome"].sample,
  age: rand(2010..2019),
  mileage: rand(1..10000),
  condition: ['Pristine', 'Good', 'It works', 'Yours to fix'].sample,
  photo: "https://ik.imagekit.io/hj8sm3kk7/large/gallery/exterior/73/985/honda-scoopy-esp-left-side-view-full-image-128865.jpg",
  price_per_day: rand(20000..80000),
  colour: ["Red", 'white', 'black', 'blue', 'pink'].sample)
  scooter.title = "#{scooter.model.name} #{Faker::Marketing.buzzwords}"
  scooter.save!
end

puts "seeding Scooters - Complete!"

#Bookings and reviews

puts "Seeding bookings"

def random_date_past
from = Date.parse('2019/1/1')
till = Date.today
from + rand(till - from)
end

def random_date_upcoming
from = Date.today
till = Date.parse('2020/12/31')
from + rand(till - from)
end

 # Bookings past
 50.times do
  fecha = random_date_past
  booking =   Booking.new(user: User.all.sample,
             scooter: Scooter.all.sample,
             start_date: fecha - rand(1..10) ,
             end_date: fecha)
  booking.price = (booking.scooter.price_per_day * (booking.end_date-booking.start_date)).to_i
  booking.save
  review = Review.new(
      user: User.all.sample,
      content: Faker::Restaurant.review,
      rating: rand(0..5))
  review.booking = booking
  review.save
end

  # Bookings upcoming
  50.times do
    fecha2 = random_date_upcoming
  booking = Booking.new(user: User.all.sample,
             scooter: Scooter.all.sample,
             start_date: fecha2 ,
             end_date: fecha2 + rand(1..10)  )
  booking.price = (booking.scooter.price_per_day * (booking.end_date-booking.start_date)).to_i
  booking.save
  review = Review.new(
      user: User.all.sample,
      content: Faker::Restaurant.review,
      rating: rand(0..5))
  review.booking = booking
  review.save
end
