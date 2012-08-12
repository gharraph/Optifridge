class Item < ActiveRecord::Base
  attr_accessible :expiration, :item_kind_id
  belongs_to :user
  belongs_to :item_kind
  before_validation :set_expiration, :on => :create
  validates_presence_of :expiration, :item_kind, :user
  after_create :send_mail
  # validates_numericality_of :item_kind_id, :user_id

  def set_expiration
    default_shelf_life = self.item_kind.shelf_lives.first
    self.expiration = Date.today + default_shelf_life.duration
  end

  def send_mail
    UserMailer.weekly_email(self.user).deliver
  end
end


