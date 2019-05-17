# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |i|
  Board.create(name: "board #{i}")
end

5.times do |i|
  List.create(name: "list #{i}", board_id: 1)
end

5.times do |i|
  Card.create(name: "card #{i}", list_id: 1)
end
