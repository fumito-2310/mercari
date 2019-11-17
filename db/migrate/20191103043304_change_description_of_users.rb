class ChangeDescriptionOfUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_column :Users, :address_prefecture, :string, null: false
  end
   
  def self.down
    change_column :Users, :address_prefecture, :string, null: false, default: "0"
  end
end
