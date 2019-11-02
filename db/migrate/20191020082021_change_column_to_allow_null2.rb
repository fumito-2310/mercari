class ChangeColumnToAllowNull2 < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :address_last_name,:string, null: true
    change_column :users, :address_first_name,:string, null: true
    change_column :users, :address_last_name_kana,:string, null: true
    change_column :users, :address_first_name_kana,:string, null: true
    change_column :users, :encrypted_password,:string, null: true
  end

  def down
    change_column :users, :address_last_name,:string, null: false
    change_column :users, :address_first_name,:string, null: false
    change_column :users, :address_last_name_kana,:string, null: false
    change_column :users, :address_first_name_kana,:string, null: false
    change_column :users, :encrypted_password,:string, null: false
  end
end