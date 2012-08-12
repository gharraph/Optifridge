require 'spec_helper'

describe UserMailer do
  let(:user) { Fabricate(:user_with_items) }
  let(:mailer) { UserMailer.weekly_email(user) }

  describe "html email" do

    it "has a subject with number of expiration items" do
      mailer.subject.should eq("You have #{user.items.count} items expiring soon.")
    end

    it "has a header" do
      mailer.body.should have_selector('h2', :text => "You might want to clean out your fridge soon. Here are the items that might need to be disposed of.")
    end

    it "has a link to the website" do
      mailer.body.should have_link("See Everything in Your Fridge", :href => root_path)
    end

    it "has a list of the user's items" do
      # We need to clean up item.item_kind.name to item.name; we know this user has 3 items from our Fabricate
      mailer.body.should have_selector('li', :text => user.items[0].item_kind.name)
      mailer.body.should have_selector('li', :text => user.items[1].item_kind.name)
      mailer.body.should have_selector('li', :text => user.items[2].item_kind.name)
    end

  end

  describe "text email" do
  end


end

