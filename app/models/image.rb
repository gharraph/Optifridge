class Image < ActiveRecord::Base
  attr_accessible :translation, :user_id, :file

  belongs_to :user
  has_attached_file :file,
    :storage => :s3,
    :s3_credentials => {
      :access_key_id => "AKIAIBUWRKMWSP5KR43Q",
      :secret_access_key => "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",
      :bucket => "optifridge_images"
    }

end
