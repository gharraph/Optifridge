require 'spec_helper'

describe 'Static pages' do
  let(:user) { Fabricate(:user_with_items) }
  subject { page }

  describe "home page" do

    describe "logged out" do
      before { visit root_path }

      it { should     have_content('Get the most out of your fridge.') }
      it { should     have_selector('a', :text => 'Optifridge') }
      it { should     have_selector('a', :text => 'Sign in') }
      it { should_not have_selector('a', :text => 'Sign up') }
      it { should     have_link("Add Items") }

      describe "clicks on Sign in" do
        before { click_link "Sign in" }

        it { should have_selector('h2', :text => 'Sign in') }
      end

      describe "clicks on logo from non-root path" do
        before do
          visit new_user_session_path
          click_link "Optifridge"
        end

        it { should have_selector('h2', :text => 'Get the most out of your fridge.') }
      end

      describe "click on Add items" do
        before { click_link "Add Items" }

        it { should have_selector('h2', :text => 'Add Items') }
      end
    end

    describe "logged in" do
      before do
        sign_in(user)
        visit root_path
      end

      it { should have_selector('h2', :text => 'Add Items') }
      it { should have_selector('h3', :text => 'Your Food Inventory') }
      it { should have_selector('li', :text => user.items[0].item_kind.name) }
    end
  end
end


