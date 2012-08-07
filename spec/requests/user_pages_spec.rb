require 'spec_helper'

describe 'User pages' do
  let(:user) { user = Fabricate(:user) }
  subject { page }

  describe "Sign in page" do
    before { visit new_user_session_path }

      describe "logged out" do
        it { should have_selector('h2', :text => 'Sign in') }
        it { should have_selector('a', :text => 'Sign up') }

        describe "with valid credentials" do
          before do
            fill_in "Email", :with => user.email
            fill_in "Password", :with => user.password
            click_button "Sign in"
          end

          it { should have_content('successfully') }
        end

        describe "with invalid credentials" do
          it "requires an email and password" do
            expect { click_button "Sign in" }.should raise_error
          end

          before { fill_in "Email", :with => user.email }

          it "requires a password" do
            expect { click_button "Sign in" }.should raise_error
          end

          # Need to test case with no email
        end
      end

      describe "logged in" do
        before do
          #Good place to create some helpers so we dont have to manually sign-in for the rest of our tests
          fill_in "Email", :with => user.email
          fill_in "Password", :with => user.password
          click_button "Sign in"
          visit new_user_session_path
        end

        it { should_not have_selector('h2', :text => 'Sign in') }
        it { should_not have_selector('a', :text => 'Sign in') }
        it { should have_content("You are already signed in.") }
        it { should have_selector('a', :text => 'Sign out') }
      end

      describe "signing out" do
        before do
          #Good place to create some helpers so we dont have to manually sign-in for the rest of our tests
          fill_in "Email", :with => user.email
          fill_in "Password", :with => user.password
          click_button "Sign in"
          click_link "Sign out"
        end

        it { should have_content("Signed out successfully.") }
        it { should have_content("Get the most out of your fridge.") }
      end
  end
end


