class AddDateToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :date, :datetime
  end
end
