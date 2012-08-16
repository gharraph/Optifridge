require 'spec_helper'

describe ItemSynonym do
  it {should belong_to(:item_kind)}
end
