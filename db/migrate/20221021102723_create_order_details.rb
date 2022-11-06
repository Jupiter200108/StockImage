class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details, id: :integer do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.integer :order_id, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
