class AddChangesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :card_number, :integer
    add_column :users, :expiry_date_month, :integer
    add_column :users, :expiry_date_year, :integer
    add_column :users, :security_code, :integer
  end
end
