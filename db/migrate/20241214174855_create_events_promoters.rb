class CreateEventsPromoters < ActiveRecord::Migration[7.1]
  def change
    create_table :events_promoters do |t|
      t.integer :event_id
      t.integer :promoter_id

      t.timestamps
    end
  end
end
