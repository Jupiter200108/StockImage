class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :end_user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
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
