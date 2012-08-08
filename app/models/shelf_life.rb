class ShelfLife < ActiveRecord::Base
  attr_accessible :duration, :item_kind_id
  belongs_to :item_kind

  validates_presence_of :duration
end
