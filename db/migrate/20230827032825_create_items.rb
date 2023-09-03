class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_fee_burden_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :estimated_shipping_id, null: false
      t.text :comment, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :price, null: false
      t.timestamps
    end
  end
end

