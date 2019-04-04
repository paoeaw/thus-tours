class Tour < ApplicationRecord
  belongs_to :provider, class_name: 'User', foreign_key: 'provider_id'
  has_many :customers, through: :bookings
  has_many :bookings

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_one, PhotoUploader
  mount_uploader :photo_two, PhotoUploader
  mount_uploader :photo_three, PhotoUploader
  validates :name, presence: true, uniqueness: true
  validates :details, presence: true
  validates :photo, presence: true
  validates :cost, presence: true,
                   numericality: { only_integer: true,
                                   greater_than_or_equal_to: 1 }
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch
  pg_search_scope :search_for_tour,
    against: [ :name, :location, :details ],
    using: {
      tsearch: { prefix: true }
    }
end
