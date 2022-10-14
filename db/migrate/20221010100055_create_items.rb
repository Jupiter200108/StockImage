class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :contents_status
      ##公開ステータス
      t.boolean :is_active,    null: false, default: "true"

      t.timestamps
    end
  end
end
