class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
    searching
    sorting
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

  def searching
    if params[:query].present?
      sql_query = "title ILIKE :query OR item ILIKE :query"
      @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
      if params[:queryLocation].present?
        sql_query_location = "location ILIKE :queryLocation"
        @offers = @offers.where(sql_query_location, queryLocation: "%#{params[:queryLocation]}%")
      end
      if params[:queryPrice].present?
        sql_query_price = "price_per_day > :queryPrice"
        @offers = @offers.where(sql_query_price, queryPrice: params[:queryPrice])
      end



      if @offers.count.zero?
        # redirect_to offers_path
        flash.alert = "Désolé, aucun résultat ne correspond à cette recherche!"
      end
    elsif params[:query] == ""
      # redirect_to offers_path
      flash.alert = "Recherche vide !"
    else
      @offers = Offer.all
    end
  end

  def sorting
    case params[:sort]
    when "price-up"
      @offers = @offers.order(:price_per_day)
    when "price-down"
      @offers = @offers.order(:price_per_day).reverse
    when "location"
      @offers = @offers.order(:location)
    end
  end

  def offer_params
    params.require(:offer).permit(:title, :item, :description, :price_per_day, :location, :start_date, :end_date, :photo)
  end
end
