class ChangeDatatypeAddressPrefectureOfUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :address_prefecture, :string
  end
end
