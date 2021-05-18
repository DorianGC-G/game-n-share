class AddStartDateToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :start_date, :date
  end
end
