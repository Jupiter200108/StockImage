class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres, id: :integer do |t|
      t.string :name
      t.integer :contents_status, null: false, default: "0"

      t.timestamps
    end
  end
end
