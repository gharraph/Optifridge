class Image < ActiveRecord::Base
  attr_accessible :translation, :user_id, :file, :stored_at

  belongs_to :user
  has_attached_file :file,
    :storage => :s3,
    :path => "/image/:id/:filename",
    :s3_permissions => :public_read,
    :s3_credentials => {
      :access_key_id => "AKIAIBUWRKMWSP5KR43Q",
      :secret_access_key => "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",
      :bucket => "optifridge_images"
    }

  after_create :define_storage_url

  def define_storage_url
   base_uri = 'https://s3.amazonaws.com/optifridge_images/image/'
   self.update_attributes(:stored_at =>  base_uri + self.id.to_s + "/" + self.file_file_name)
  end

end
