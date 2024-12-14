class AddPhoneNumberToConsumers < ActiveRecord::Migration[7.1]
  def change
    add_column :consumers, :phone_number, :string
  end
end
