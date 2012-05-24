class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :start_date, :end_date, :number_of_guests

  validates_presence_of :start_date, :end_date, :number_of_guests
  validate :end_greater_than_start

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def end_greater_than_start
    if !start_date.blank? and !end_date.blank?
      self.errors.add(:base, "End Date should be greater than Start Date") if (start_date.to_date >= end_date.to_date)
    end
  end

  def bookings
    s_date = start_date.to_date
    e_date = end_date.to_date
    guests = number_of_guests.to_i
    bookings = Booking.where( "(start_date <= ? AND end_date >= ?) OR
          (start_date <= ? AND end_date >= ?) OR
          (start_date >= ? AND end_date <= ?) OR 
          (start_date <= ? AND end_date >= ?)",
          s_date,s_date,e_date,e_date,s_date,e_date,s_date, e_date )
    completely_filled = []
    pending_capacity = {}
    bookings.group_by(&:room_id).sort.each do |room, booking|
      booked_guests = 0
      booking.each do |b|
        booked_guests += b.number_of_guests
      end
      if booked_guests + guests > booking.last.room.capacity
        completely_filled << booking.last.room
      else
        pending_capacity.merge!({booking.last.room.id.to_s => booking.last.room.capacity - booked_guests })
      end
    end
    p pending_capacity
    return Room.where("capacity >= ?",number_of_guests.to_i ) - completely_filled, pending_capacity
  end

end
