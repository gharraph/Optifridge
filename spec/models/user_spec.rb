require 'spec_helper'

describe User do
  let(:user) { Fabricate(:user_with_items) }

  it { should have_many(:items) }

  it "should throw an error if a user doesn't have an email" do
    expect { User.create(:password => "password") }.should raise_error
  end

  it "should throw an error if a user doesn't have a password" do
    expect { User.create(:email => "p@example.com") }.should raise_error
  end

  it "requires an email and password to create an account" do
    User.create(:email => "p@example.com", :password => "password").should be_valid
  end

  it "validates a correct email format" do
    User.create(:email => "p", :password => "password").should_not be_valid
    User.create(:email => "p@", :password => "password").should_not be_valid
    User.create(:email => "p@example", :password => "password").should_not be_valid
    User.create(:email => "p@example.com", :password => "password").should be_valid
  end

  it "validates that you have a 6 character password" do
    User.create(:email => "p@example.com", :password => "passw").should_not be_valid
    User.create(:email => "p@example.com", :password => "passwo").should be_valid
  end

  describe "email sends" do
    it "it should be able to send an email with all associated items" do
      user.send_weekly_email
      ActionMailer::Base.deliveries.last.to.should include(user.email)
    end
  end
end

