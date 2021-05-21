class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
    @offers = policy_scope(Offer).where(user_id: current_user.id)

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
