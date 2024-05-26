class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.string :title, null: false
      t.string :body, null: false
    end
  end
end
