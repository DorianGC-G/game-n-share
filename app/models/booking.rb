class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  validate :end_date_after_start_date
  validates :start_date, :end_date, :overlap => true

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
