class ChangeItemsLocationStorage < ActiveRecord::Migration
  def up
    rename_column :items, :location, :storage
  end

  def down
  end
end
