class ItemKind < ActiveRecord::Base
  attr_accessible :name

  has_many :shelf_lives, :order => 'duration ASC'
  has_many :locations, :through => :shelf_lives
  has_many :items
  validates_presence_of :name
  before_save :force_utf_encoding


  def self.find_by_name_lower_case(term_params)
    order(:name).where("LOWER(name) like ?", "%#{term_params.downcase}%")
  end
  
  private

  def force_utf_encoding
   self.name.gsub!(/\W/, " ")
  end

end

