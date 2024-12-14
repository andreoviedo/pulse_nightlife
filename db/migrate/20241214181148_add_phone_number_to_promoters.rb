class AddPhoneNumberToPromoters < ActiveRecord::Migration[7.1]
  def change
    add_column :promoters, :phone_number, :integer
  end
end
