class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, id: :integer do |t|
      t.integer :end_user_id, null: false, foreign_key: true
      t.integer :total_payment
      t.integer :payment_method, default: 0, null: false

      t.timestamps
    end
  end
end
