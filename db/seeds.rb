# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



require "faker"

# Clear existing data
puts "Clearing existing data..."
Venue.destroy_all
Event.destroy_all
Promoter.destroy_all
Consumer.destroy_all
Order.destroy_all
EventsPromoter.destroy_all
EventsConsumer.destroy_all


# Create specific test users first
puts "Creating test users..."

# Create test venue
Venue.create!(
  email: "venue1@example.com",
  password: "password",
  name: "The Grand Ballroom",
  address: "123 Main St, City",
  description: "A luxurious venue in the heart of the city",
  capacity: 500
)

# Create test promoter
Promoter.create!(
  email: "promoter1@example.com",
  password: "password",
  name: "John Smith",
  phone_number: "555-0123",
  instagram_handle: "@johnpromoter"
)

# Create test consumer
Consumer.create!(
  email: "consumer1@example.com",
  password: "password",
  name: "Mike Wilson",
  phone_number: "555-4567",
  date_of_birth: "1990-01-01"
)

# Create Venues
puts "Creating venues..."
venues = []
5.times do
  venue = Venue.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    name: Faker::Company.unique.name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    capacity: rand(100..1000)
  )
  venues << venue
end

# Create Promoters
puts "Creating promoters..."
promoters = []
10.times do
  promoter = Promoter.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.cell_phone,
    instagram_handle: "@#{Faker::Internet.username}"
  )
  promoters << promoter
end

# Create Consumers
puts "Creating consumers..."
consumers = []
20.times do
  consumer = Consumer.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.cell_phone,
    date_of_birth: Faker::Date.between(from: 21.years.ago, to: 50.years.ago)
  )
  consumers << consumer
end

# Create Events
puts "Creating events..."
events = []
venues.each do |venue|
  rand(2..4).times do
    event = Event.create!(
      venue: venue,
      name: Faker::Music.album,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      date: Faker::Time.between(from: DateTime.now, to: 2.months.from_now),
      price: rand(20..200),
      capacity: rand(50..venue.capacity)
    )
    events << event

    # Associate random promoters with each event
    # Select random promoters without replacement
    selected_promoters = promoters.sample(rand(1..3))
    selected_promoters.each do |promoter|
      EventsPromoter.create!(
        event: event,
        promoter: promoter,
        commission_rate: rand(5..15)
      )
    end
  end
end

# Create Orders and EventsConsumer records
# Create Orders and EventsConsumer records
puts "Creating orders and consumer event associations..."
events.each do |event|
  # Get a random selection of unique consumers for this event
  event_consumers = consumers.sample(rand(5..15))
  
  event_consumers.each do |consumer|
    # Create EventsConsumer record (RSVP)
    EventsConsumer.create!(
      event: event,
      consumer: consumer,
      status: ["interested", "going"].sample
    )
    
    # Maybe create an order (some consumers who RSVP might not order)
    if rand < 0.7 # 70% chance of creating an order
      num_tickets = rand(1..4)
      Order.create!(
        event: event,
        consumer: consumer,
        quantity: num_tickets,
        total_price: event.price * num_tickets,
        status: ["pending", "confirmed", "completed"].sample
      )
    end
  end
end

puts "Seed data creation completed!"
