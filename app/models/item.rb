class Item < ActiveRecord::Base
  attr_accessible :expiration, :item_kind_id, :user_id
  belongs_to :user
  validates_presence_of :expiration, :item_kind_id, :user_id
  validates_numericality_of :item_kind_id, :user_id
end
