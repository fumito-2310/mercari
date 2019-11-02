class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :birthdate_year,:integer, null: true
    change_column :users, :birthdate_month,:integer, null: true
    change_column :users, :birthdate_day,:integer, null: true
  end

  def down
    change_column :users, :birthdate_year,:string, null: false
    change_column :users, :birthdate_month,:integer, null: false
    change_column :users, :birthdate_day,:integer, null: false
  end
end
