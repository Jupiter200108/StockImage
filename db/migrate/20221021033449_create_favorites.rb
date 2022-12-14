class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites, id: :integer do |t|
      t.integer :end_user_id, null: false, foreign_key: true
      t.integer :item_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
