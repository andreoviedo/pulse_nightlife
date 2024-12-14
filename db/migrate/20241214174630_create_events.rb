class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :venue_id

      t.timestamps
    end
  end
end
