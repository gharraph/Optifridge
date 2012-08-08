class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :type
      t.integer :shelf_life_id

      t.timestamps
    end

  end
end
