class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @offers = Offer.all

    # if params[:query].present?
    #   sql_query = "title ILIKE :query OR item ILIKE :query OR description ILIKE :query OR location ILIKE :query"
    #   @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @offers = Offer.all
    # end
  end
end
