class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price_without_tax, null: false
      t.integer :status, null: false, default: 0
    end
  end
end
