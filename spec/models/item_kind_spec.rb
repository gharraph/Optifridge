require 'spec_helper'

describe ItemKind do

  it {should have_many(:shelf_lives)}
  it {should validate_presence_of(:name)}
  it {should have_many(:locations)}
  it {should have_many(:items)}
  
  describe "#find_by_name_lower_case" do
    it "should lower case user's input and find item kind name" do
      @item_kind = Fabricate (:item_kind)
      ItemKind.find_by_name_lower_case("apr").should include @item_kind 
    end
  end

end

