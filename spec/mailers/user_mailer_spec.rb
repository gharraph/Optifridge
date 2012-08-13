require 'spec_helper'

describe UserMailer do
  let(:user) { Fabricate(:user_with_items) }
  let(:oldest_item) { user.items[0] }
  let(:mailer) { UserMailer.weekly_email(user) }

  before do
    3.times do |n|
      item = Fabricate(:item, :user => user)
      item.expiration = Date.today + n
      item.save
    end
  end

  describe "html email" do

    it "has a subject with number of expiration items" do
      mailer.subject.should eq("You have #{user.items.count} items expiring soon.")
    end

    it "has a header" do
      mailer.body.should have_selector('h2', :text => "You might want to clean out your fridge soon. Here are the items that might need to be disposed of.")
    end

    it "has a link to the website" do
      mailer.body.should have_link("See Everything in Your Fridge", :href => root_url)
    end

    it "has a list of the user's items and expirations" do
      # We need to clean up item.item_kind.name to item.name; we know this user has 3 items from our Fabricate
      mailer.body.should have_selector('li', :text => user.items[0].item_kind.name)
      mailer.body.should have_selector('li', :text => user.items[1].item_kind.name)
      mailer.body.should have_selector('li', :text => user.items[2].item_kind.name)
    end

    it "has the expirations for each item" do
      mailer.body.should have_selector('li', :text => user.items[0].expiration.to_s)
      mailer.body.should have_selector('li', :text => user.items[1].expiration.to_s)
      mailer.body.should have_selector('li', :text => user.items[2].expiration.to_s)
    end

    it "shows five total items in the list" do
      # This isn't actually working right now, size doesnt seem to yield anything
      # puts mailer.body.inspect
      mailer.body.should have_selector('li', :size => 5)
    end

    it "orders the items in order of nearest to expire" do
      mailer.body.should have_selector('li:first-child', :text => "#{ Date.today }")
      mailer.body.should have_selector('li:last-child', :text => "#{ Date.today + oldest_item.item_kind.shelf_lives.first.duration }")
    end

  end

  describe "text email" do
  end


end

