require 'spec_helper'

describe ItemKind do

  it {should have_many(:shelf_lives)}
  it {should validate_presence_of(:name)}
  it {should have_many(:locations)}

end

