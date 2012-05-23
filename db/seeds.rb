require 'import'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Host.count == 0
  hosts_file = File.expand_path('../data/hosts.csv', __FILE__)
  count = import_hosts_csv( hosts_file )
  puts "#{count} hosts imported"
end

if Room.count == 0
  rooms_file = File.expand_path('../data/rooms.csv', __FILE__)
  count = import_rooms_csv( rooms_file )
  puts "#{count} rooms imported"
end

if Booking.count == 0
  bookings_file = File.expand_path('../data/bookings.csv', __FILE__)
  count = import_bookings_csv( bookings_file )
  puts "#{count} bookings imported"
end

