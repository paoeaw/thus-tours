class Tour < ApplicationRecord
  belongs_to :provider, class_name: 'User', foreign_key: 'provider_id'
  has_many :customers, through: :bookings
  has_many :bookings

  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, uniqueness: true
  validates :details, presence: true
  validates :photo, presence: true
  validates :cost, presence: true, numericality: { only_integer: true }
  validates :location, presence: true
end
