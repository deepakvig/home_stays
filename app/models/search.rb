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
          s_date,s_date,e_date,e_date,s_date,e_date,s_date, e_date ).select{|p| p.number_of_guests + guests > p.room.capacity}.map(&:room)
    return bookings
  end

end
