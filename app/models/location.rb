class Location < ActiveRecord::Base
  attr_accessible :shelf_life_id, :type

  validates_presence_of :type
end
