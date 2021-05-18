class AddEndDateToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :end_date, :date
  end
end
