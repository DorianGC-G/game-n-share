class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
    # @offers = policy_scope(Offer).where(user_id: current_user.id)
    # @bookings = policy_scope(Booking)
    # @offers_sent = []
    # policy_scope(Offer).each { |offer| @offers_sent << offer if offer.bookings.user == current_user }
    @offers = policy_scope(Booking).where(user_id: current_user.id).map { |b| b.offer }
    @bookings_received = []
    policy_scope(Booking).each do |booking|
      @bookings_received << booking if booking.offer.user == current_user
    end
    @offers_received = @bookings_received.map { |b| b.offer }
    if params[:sort] == "price-up"
      @offers = @offers.order(:price_per_day)
    elsif params[:sort] == "price-down"
      @offers = @offers.order(:price_per_day).reverse
    elsif params[:sort] == "location"
      @offers = @offers.order(:location)
    end
  end

  def success
  end

  def home
    @offers = Offer.last(6).reverse
  end
end
