class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :end_user, null: false, foreign_key: true
      t.integer :total_payment
      t.integer :payment_method

      t.timestamps
    end
  end
end
