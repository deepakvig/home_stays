class Room < ActiveRecord::Base
  belongs_to :host
  has_many :bookings
end
