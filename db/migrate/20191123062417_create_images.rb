class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :file_name, null: false
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
