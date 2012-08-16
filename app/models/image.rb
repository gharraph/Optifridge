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

  def items_from_receipt(current_user)
    @current_user = current_user
    @synonyms = ItemSynonym.all
    processed_receipt_text.each do |line|
      check_against_synonyms(line)
    end
  end

  def check_against_synonyms(line)
    @synonyms.each do |synonym|
      create_item(synonym.item_kind_id) if synonym.match?(line)
    end
  end

  def create_item(item_kind_id)
   @current_user.items.create(:item_kind_id => item_kind_id)
  end

  private

    def processed_receipt_text
      split_lines(self.translation)
    end

    def split_lines(text_block)
      remove_empty(text_block.split('\n'))
    end

    def remove_empty(text_arr)
      text_arr.select{|element| !element.empty? }
    end


end
