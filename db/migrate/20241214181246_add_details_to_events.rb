class AddDetailsToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :description, :text
    add_column :events, :ticket_price, :decimal
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
    add_column :events, :age_restriction, :string
    add_column :events, :ticket_link, :string
    add_column :events, :image, :string
    add_column :events, :status, :string
    add_column :events, :capacity, :integer
  end
end
