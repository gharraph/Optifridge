class ItemSynonym < ActiveRecord::Base
  attr_accessible :item_kind_id, :name

  belongs_to :item_kind

  def match?(receipt_line)
    !(receipt_line =~ /#{self.name}/i).nil?
  end
end
