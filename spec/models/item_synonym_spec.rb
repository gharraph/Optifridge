require 'spec_helper'

describe ItemSynonym do
  it {should belong_to(:item_kind)}
  before do
    @line1 = "Card Savings                          .90-\r\n\r\nWT      NECTARINES"
    @line2 = "WT      BANANAS                    +               .90 F"
    @line3 = "EATING RT HUMMUS S                  .    2.50 F"
    ["BANANAS", "hummus"].each do |synonym|
      f = Fabricate(:item_synonym)
      f.update_attributes(:name => synonym)
    end
  end

  context "#match?" do
    it "should match its name in a receipt line" do
      synonym1 = ItemSynonym.first
      synonym2 = ItemSynonym.last
      synonym1.match?(@line1).should eq(false);
      synonym2.match?(@line1).should eq(false);
      synonym1.match?(@line2).should eq(true);
      synonym2.match?(@line3).should eq(true);
    end
  end
end
