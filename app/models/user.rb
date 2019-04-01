class User < ApplicationRecord
  has_many :tours, class_name: 'Tour', foreign_key: 'provider_id'
  has_many :bookings, class_name: 'Booking', foreign_key: 'customer_id'
end
