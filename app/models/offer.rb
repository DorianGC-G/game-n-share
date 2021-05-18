class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :item, :description, :location, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
