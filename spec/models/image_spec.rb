require 'spec_helper'

describe Image do
  it { should belong_to(:user) }


  it "should be able to match parts of the translation to existing item_synonyms" do
    Fabricate(:item_synonym)

  end

end
