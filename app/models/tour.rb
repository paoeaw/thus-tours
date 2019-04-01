class Tour < ApplicationRecord
  belongs_to :provider, class_name: 'User', foreign_key: 'provider_id'
  has_many :customers, through: :bookings
  has_many :bookings
  mount_uploader :photo, PhotoUploader
end
