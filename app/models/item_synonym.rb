class ItemSynonym < ActiveRecord::Base
  attr_accessible :item_kind_id, :name

  belongs_to :item_kind
end
