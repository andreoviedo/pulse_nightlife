class AddDetailsToPromoters < ActiveRecord::Migration[7.1]
  def change
    add_column :promoters, :company_name, :string
    add_column :promoters, :website, :string
    add_column :promoters, :description, :text
    add_column :promoters, :social_media_links, :text
    add_column :promoters, :logo, :string
  end
end
