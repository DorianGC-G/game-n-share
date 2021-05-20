class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)

    if params[:query].present?
      sql_query = "title ILIKE :query OR item ILIKE :query OR description ILIKE :query OR location ILIKE :query"
      @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
      if @offers.count == 0
        redirect_to root_path
      end
    else
      @offers = Offer.all
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
    @user = @offer.user
    @booking = Booking.new
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    authorize @offer
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :item, :description, :price_per_day, :location, :start_date, :end_date, :photo)
  end

end
