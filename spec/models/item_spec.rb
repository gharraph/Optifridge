require 'spec_helper'

describe Item do


  it { should belong_to(:user) }
  it { should belong_to(:item_kind) }

  it "validates a valid datetime format"

  context "#set_expiration" do
    it "calculates experation date based on duration of its parent item_kind shortest shelf life" do
      @user = User.new(:email => "s@example.com", :password => "password")
      @item_kind = ItemKind.create(:name => "APRICOTS FRESH, RAW, CUT UP")
      @shelf_life1 = @item_kind.shelf_lives.create(:duration => 365)
      @shelf_life2 = @item_kind.shelf_lives.create(:duration => 150)
      @location1 = @shelf_life1.create_location(:name => "Pantry")
      @location2 = @shelf_life2.create_location(:name => "Refridgerator")
      @item = @item_kind.items.new
      @item.user = @user
      @item.save
      @item.expiration.should eq(Date.today + 150)
    end
  end

end
