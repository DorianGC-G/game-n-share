class BookingsController < ApplicationController

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
  end

  def create
  end

end
