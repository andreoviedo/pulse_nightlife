class AddPriceToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :price, :decimal
  end
end
