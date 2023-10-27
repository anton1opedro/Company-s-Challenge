# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Creating the seats for our Room

rows = 25
columns = 20
room = Room.create(name: "Teatro Diogo Bernardes")

rows.times do |x|
  columns.times do |y|
    room.seats.create(x: x, y: y, status: 0)
  end
end

puts 'Seats created successfully!'


