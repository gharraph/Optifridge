class ShelfLife < ActiveRecord::Base
  attr_accessible :duration, :item_kind_id
  belongs_to :item_kind
  has_one :location

  validates_presence_of :duration
end
