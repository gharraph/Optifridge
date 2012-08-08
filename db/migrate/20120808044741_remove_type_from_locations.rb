class RemoveTypeFromLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :type
  end

  def down
  end
end
