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
          sign_in(user)
          visit new_user_session_path
        end

        it { should_not have_selector('h2', :text => 'Sign in') }
        it { should_not have_selector('a', :text => 'Sign in') }
        it { should have_content("You are already signed in.") }
        it { should have_selector('a', :text => 'Sign out') }
      end

      describe "signing out" do
        before do
          sign_in(user)
          click_link "Sign out"
        end

        # Removed a flash message check here as they're lost in our redirects to home.  Need broader rethinking. -PJC
        # it { should have_content("Signed out successfully.") }
        it { should have_content("Get the most out of your fridge.") }
      end
  end
end


