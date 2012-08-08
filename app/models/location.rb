class Location < ActiveRecord::Base
  attr_accessible :shelf_life_id, :name

  belongs_to :shelf_life
  validates_presence_of :name
end
