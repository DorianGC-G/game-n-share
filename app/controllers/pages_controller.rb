class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
    @offers = policy_scope(Offer).where(user_id: current_user.id)
  end

  def home
    @offers = Offer.last(6).reverse
  end
end
