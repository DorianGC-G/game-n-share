class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    authorize @offer
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :item, :description, :price_per_day, :location, :start_date, :end_date)
  end

end
