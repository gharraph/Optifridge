class CreateItemSynonyms < ActiveRecord::Migration
  def change
    create_table :item_synonyms do |t|
      t.string :name
      t.integer :item_kind_id

      t.timestamps
    end

    add_index :item_synonyms, :name
  end
end
