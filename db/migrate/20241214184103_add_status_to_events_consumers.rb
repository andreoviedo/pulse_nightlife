class AddStatusToEventsConsumers < ActiveRecord::Migration[7.1]
  def change
    add_column :events_consumers, :status, :string
  end
end
