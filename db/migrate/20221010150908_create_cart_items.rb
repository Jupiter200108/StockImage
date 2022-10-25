class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items, id: :integer do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.integer :end_user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
