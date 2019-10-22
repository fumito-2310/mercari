class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.text :explanation, null: false
      t.string :details_category, null: false
      t.string :details_state, null: false
      t.string :delivery_fee, null: false
      t.string :delivery_area, null: false
      t.string :delivery_days, null: false
      t.integer :price, null: false
      t.integer :seller_id, null: false
      t.integer :buyer_id, null: false
      t.timestamps
    end
  end
end
