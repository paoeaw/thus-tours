class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tours, class_name: 'Tour', foreign_key: 'provider_id'
  has_many :bookings, class_name: 'Booking', foreign_key: 'customer_id'

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
