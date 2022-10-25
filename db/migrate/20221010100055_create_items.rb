class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items, id: :integer do |t|
      t.integer :end_user_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.integer :genre_id, null: false, foreign_key: true
      t.string :name
      t.text :introduction
      t.integer :price, null: false, default: "1000"
      t.integer :contents_status
      ##公開ステータス
      t.boolean :is_active, null: false, default: "true"

      t.timestamps
    end
  end
end
