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

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if params[:accept] == "accepted"
      @booking.status = true
    elsif params[:accept] == "declined"
      @booking.status = false
    end
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
