require 'spec_helper'

describe Item do
  [:user_id, :expiration, :item_kind_id].each do |attr|
    it { should respond_to(attr) }
    it { should validate_presence_of(attr) }
  end

  [:user_id, :item_kind_id].each do |attr|
    it { should validate_numericality_of(attr) }
  end

  it { should belong_to(:user) }

  it "validates a valid datetime format"
end
