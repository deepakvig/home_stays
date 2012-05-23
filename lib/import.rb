require 'csv'

def import_hosts_csv( hosts_csv_file )
  hosts_csv = CSV.read( hosts_csv_file, { :headers => :true })
  count = 0
  hosts_csv.each do |country_csv|
    Host.find_or_create_by_ref( country_csv.to_hash )
    count += 1
  end
  count
end

def import_rooms_csv( rooms_csv_file )
  rooms_csv = CSV.read( rooms_csv_file, { :headers => :true })
  count = 0
  rooms_csv.each do |room_csv|
    room_hash = room_csv.to_hash
    if host = Host.find_or_create_by_ref( :ref => room_hash['host_ref'] )
      Room.find_or_create_by_ref( :host_id => host.id , :ref => room_hash['ref'], :capacity => room_hash['capacity'] )
      count += 1
    end
  end
  count
end

def import_bookings_csv( bookings_csv_file )
  bookings_csv = CSV.read( bookings_csv_file, { :headers => :true })
  count = 0
  bookings_csv.each do |booking_csv|
    booking_hash = booking_csv.to_hash
    if room = Room.find_or_create_by_ref( :ref => booking_hash['room_ref'])
      p booking_hash
      Booking.find_or_create_by_ref( :room_id => room.id , :ref => booking_hash['ref'], :start_date => booking_hash['start_date'], :end_date => booking_hash['end_date'], :number_of_guests => booking_hash['number_of_guests'] )
      count += 1
    end
  end
  count
end
