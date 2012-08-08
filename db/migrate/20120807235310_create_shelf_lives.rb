class CreateShelfLives < ActiveRecord::Migration
  def change
    create_table :shelf_lives do |t|
      t.integer :item_kind_id
      t.integer :duration

      t.timestamps
    end

    add_index :shelf_lives, :item_kind_id

  end
end
