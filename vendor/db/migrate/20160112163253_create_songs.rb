class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.belongs_to :artist
      t.belongs_to :genre

      t.timestamps null: false
    end
  end
end
