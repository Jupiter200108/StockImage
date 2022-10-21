class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.string :end_user_id
      t.string :item_id

      t.timestamps
    end
  end
end
