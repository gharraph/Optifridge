class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :translation
      t.integer :user_id
      t.string :stored_at

      t.timestamps
    end
  end
end
