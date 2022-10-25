class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details,id: :integer do |t|
      t.references :item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
