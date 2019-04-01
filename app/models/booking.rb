class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
  belongs_to :tour
  belongs_to :provider, through: :tour
end
