# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Starting seed process...'
titles = ['Room 1', 'Room 2', 'Room 3', 'Room 4']

titles.each do |title|
  room = Room.create(name: title)
  starts_at = DateTime.new(2022, 06, 17, 9, 0, 0)
  ends_at = DateTime.new(2022, 06, 30, 18, 0, 0)
  rand_time = rand(30..90).minutes

  Meeting.create(title: 'Latest Announcements', starts_at: starts_at + rand_time, ends_at: ends_at + rand_time, room: room)
end

puts 'Finished seed process!'
