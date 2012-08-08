class ItemKind < ActiveRecord::Base
  attr_accessible :name

  has_many :shelf_lives
  has_many :locations, :through => :shelf_lives
  validates_presence_of :name

end
