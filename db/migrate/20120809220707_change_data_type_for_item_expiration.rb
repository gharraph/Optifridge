class ChangeDataTypeForItemExpiration < ActiveRecord::Migration
  def up
    change_table :items do |t|
      t.change :expiration, :date
    end
  end
end
