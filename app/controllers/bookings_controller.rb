class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @offer = Offer.find(params[:offer_id])

    authorize @booking
    @booking.user = current_user
    @booking.offer = @offer
    if @booking.save
      redirect_to dashboard_path
    else
      render "offers/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
