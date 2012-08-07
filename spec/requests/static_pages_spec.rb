require 'spec_helper'

describe 'Static pages' do
  subject { page }

  describe "home page" do

    describe "logged out" do
      before { visit root_path }

      it { should     have_content('Get the most out of your fridge.') }
      it { should     have_selector('a', :text => 'Optifridge') }
      it { should     have_selector('a', :text => 'Sign in') }
      it { should_not have_selector('a', :text => 'Sign up') }
      it { should     have_button("Let's boogie") }

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

    end

  end

end


