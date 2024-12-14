class AddPromoterToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :promoter, null: false, foreign_key: true
  end
end
