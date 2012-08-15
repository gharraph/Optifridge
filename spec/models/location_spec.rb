require 'spec_helper'

describe Location do
  it { should validate_presence_of(:name) }
  it { should belong_to(:shelf_life) }
end
