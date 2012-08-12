require 'spec_helper'

describe Item do
  let(:user) { Fabricate(:user_with_items) }

  it { should belong_to(:user) }
  it { should belong_to(:item_kind) }

  it "validates a valid datetime format"

  context "#set_expiration" do
    it "calculates experation date based on duration of its parent item_kind shortest shelf life" do
      user.items[0].expiration.should eq(Date.today + user.items[0].item_kind.shelf_lives.first.duration)
    end
  end

  context "#initialize" do
    it "generates a mailer" do
      ActionMailer::Base.deliveries.last.to.should include(user.email)
    end
  end

end
