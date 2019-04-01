class User < ApplicationRecord
  has_many :tours
  has_many :bookings
end
