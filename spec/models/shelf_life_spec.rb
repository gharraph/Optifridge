require 'spec_helper'

describe ShelfLife do

  it {should belong_to(:item_kind)}
  it {should validate_presence_of(:duration)}

end
