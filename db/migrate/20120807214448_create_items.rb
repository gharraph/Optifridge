class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :item_kind_id
      t.datetime :expiration

      t.timestamps
    end
  end
end
