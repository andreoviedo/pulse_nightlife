class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :table_service_id
      t.integer :consumer_id
      t.integer :event_id

      t.timestamps
    end
  end
end
