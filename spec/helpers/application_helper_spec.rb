require 'spec_helper'

describe ApplicationHelper do
  it "updates the flash key for inserting into our class definitions for flash styling" do
    make_flash_class(:notice).should eq "success"
    make_flash_class(:alert).should eq "error"
    make_flash_class(:something).should eq "notice"
  end
end
