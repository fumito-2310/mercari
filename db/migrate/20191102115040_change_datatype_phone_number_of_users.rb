class ChangeDatatypePhoneNumberOfUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :phone_number, :string
    change_column :users, :address_phone_number, :string
  end
end
