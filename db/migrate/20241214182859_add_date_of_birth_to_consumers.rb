class AddDateOfBirthToConsumers < ActiveRecord::Migration[7.1]
  def change
    add_column :consumers, :date_of_birth, :date
  end
end
