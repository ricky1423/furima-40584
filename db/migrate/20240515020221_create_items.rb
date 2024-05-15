class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true

      t.string :neme, null: false
      t.text :explain, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shopping_free_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :schedule_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
