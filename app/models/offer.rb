class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :item, :description, :location, :start_date, :end_date, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
