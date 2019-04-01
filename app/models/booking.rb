class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
  belongs_to :tour
  validates :headcount, presence: true, numericality: { only_integer: true }
  validates :date, presence: true
end
