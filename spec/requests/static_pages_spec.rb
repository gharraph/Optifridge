require 'spec_helper'

describe 'Static pages' do
  subject { page }

  describe "home page" do

    describe "logged out" do
      before { visit root_path }

      it { should have_content('Get the most out of your fridge.') }
      it { should have_selector('a', :text => 'OptiFridge') }
      it { should have_selector('a', :text => 'Sign in') }

    end

  end

end


