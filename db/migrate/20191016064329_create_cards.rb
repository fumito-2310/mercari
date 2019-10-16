class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :user_id, null: false
      t.integer :card_number, null: false
      t.date :expiry_date_month, null: false
      t.date :expiry_date_year, null: false
      t.integer :security_code, null: false

      t.timestamps
    end
  end
end
