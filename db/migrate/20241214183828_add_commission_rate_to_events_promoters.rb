class AddCommissionRateToEventsPromoters < ActiveRecord::Migration[7.1]
  def change
    add_column :events_promoters, :commission_rate, :decimal
  end
end
