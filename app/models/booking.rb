class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
  belongs_to :tour
  validates :headcount, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 15 }
  validates :date, presence: true

  def nice_date
    date.strftime("%b %d, %Y") if date
  end
end
