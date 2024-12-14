class AddInstagramHandleToPromoters < ActiveRecord::Migration[7.1]
  def change
    add_column :promoters, :instagram_handle, :string
  end
end
