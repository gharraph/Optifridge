require 'spec_helper'

describe "item pages" do
  let(:user) { Fabricate(:user_with_items) }
  subject { page }

  describe "new" do
    before { visit new_item_path }

    it { should have_selector('h2', :text => 'Add Items') }
    it { should have_field('Item') }
    it { should have_button('Create Item') }

    describe "logged in" do
      describe "create new item" do
        # NOTE this will break once we have the form acting as it should
        before do
          sign_in(user)
          visit new_item_path
          fill_in "Item kind", :with => 1
          fill_in "Expiration", :with => "2012-08-05 00:00:00"
          click_button "Create Item"
        end

        it { should have_content "Item created successfully" }
      end
    end

    describe "logged out" do
      describe "create new item" do
        before do
          fill_in "Item kind", :with => 1
          fill_in "Expiration", :with => "2012-08-05 00:00:00"
          click_button "Create Item"
        end

        it { should have_selector('h2', :text => "Sign in") }
        it { should have_content("You need to sign in or sign up before continuing.") }

        describe "signing in redirects back to create new item" do
          before do
            sign_in(user)
          end

          it { should have_selector('h2', :text => 'Add Items') }
          it { should have_selector('input', :with => "2012-08-05 00:00:00") }
        end
      end
    end
  end

  describe "index" do
    before { visit items_path }

    describe "logged in" do
      before do
        fill_in "Email", :with => user.email
        fill_in "Password", :with => user.password
        click_button "Sign in"
      end

      it { should have_selector('h2', :text => "Your Items") }

      describe "has no items" do
        # Not sure if we'll need a prompt here when we go jquery so let's hold off for now.
      end

      describe "has items" do
        # Necessarily ugly for now until we have our item_kind db with real content
        it { should have_selector('li', :text => user.items.first.item_kind_id.to_s) }
        it { should have_selector('li', :text => user.items.last.item_kind_id.to_s) }

      end
    end

    describe "logged out" do
       it { should have_selector('h2', :text => "Sign in") }
       it { should have_content("You need to sign in or sign up before continuing.") }
    end
  end

end