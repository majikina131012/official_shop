class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|

      t.timestamps
      t.string :title, null: false
      t.string :body, null: false
    end
  end
end
