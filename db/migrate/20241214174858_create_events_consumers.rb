class CreateEventsConsumers < ActiveRecord::Migration[7.1]
  def change
    create_table :events_consumers do |t|
      t.integer :consumer_id
      t.integer :event_id

      t.timestamps
    end
  end
end
