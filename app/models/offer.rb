class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :item, :description, :location, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
