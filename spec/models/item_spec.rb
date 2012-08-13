require 'spec_helper'

describe Item do
  let(:user) { Fabricate(:user_with_items) }

  it { should belong_to(:user) }
  it { should belong_to(:item_kind) }


  it "validates presence of location" do
    expect { Fabricate(:item, :storage => nil) }.to raise_error
  end

  it "validates a valid datetime format"

  context "#set_expiration" do
    it "calculates experation date based on duration of its parent item_kind shortest shelf life" do
      user.items[0].expiration.should eq(Date.today + user.items[0].item_kind.shelf_lives.first.duration)
    end
  end

  # it { should validate_presence_of(:storage) }

end
