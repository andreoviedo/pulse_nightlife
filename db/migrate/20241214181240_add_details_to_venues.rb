class AddDetailsToVenues < ActiveRecord::Migration[7.1]
  def change
    #add_column :venues, :capacity, :integer
    #add_column :venues, :address, :string
    add_column :venues, :phone_number, :string
    add_column :venues, :website, :string
    #add_column :venues, :description, :text
    add_column :venues, :opening_hours, :string
    add_column :venues, :amenities, :text
    add_column :venues, :social_media_links, :text
    add_column :venues, :images, :string
  end
end
