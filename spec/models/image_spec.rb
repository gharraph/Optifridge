require 'spec_helper'

describe Image do
  let(:image) { Fabricate(:image) }
  it { should belong_to(:user) }

  # can't seem to get the file upload part of the fabricate working
  it "has an amazon storage url based on its name" # do
  #     synonym.stored_at.should eq "https://s3.amazonaws.com/optifridge_images/image/#{synonym.id}/#{synonym.name}"
  #   end
end
