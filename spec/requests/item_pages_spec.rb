require 'spec_helper'


describe "item pages" do
  before do
    @user = User.create(:email => "s@example.com", :password => "password")
    @item_kind = ItemKind.create(:name => "APRICOTS FRESH, RAW, CUT UP")
    @shelf_life1 = @item_kind.shelf_lives.create(:duration => 365)
    @shelf_life2 = @item_kind.shelf_lives.create(:duration => 150)
    @location1 = @shelf_life1.create_location(:name => "Pantry")
    @location2 = @shelf_life2.create_location(:name => "Refridgerator")
  end
  subject { page }

  describe "new" do
    before { visit new_item_path }

    it { should have_selector('h2', :text => 'Add Items') }
    it { should have_field("item_item_kind_name") }
    it { should have_button('Create Item') }

    describe "logged in" do
      describe "create new item" do
        # NOTE this will break once we have the form acting as it should
        before do
          sign_in(@user)
          visit items_path
          fill_in "item_item_kind_name", :with => @item_kind.name
          click_button "Create Item"
        end

        # it {should have_selector('li:last-child .date', :text => (Date.today + 360).to_s)} Fix this
        it { should have_content "Item created successfully" }

      end
    end

    describe "logged out" do
      describe "create new item" do
        before do
          fill_in "item_item_kind_name", :with => @item_kind.name
          click_button "Create Item"
        end

        it { should have_selector('h2', :text => "Sign in") }
        it { should have_content("You need to sign in or sign up before continuing.") }

        describe "signing in redirects back to create new item" do
          before do
            sign_in(@user)
          end

          it { should have_selector('h2', :text => 'Add Items') }
          it { should have_selector('input', :with => @item_kind.name) }
        end
      end
    end
  end

  describe "index" do
    describe "logged in" do
      before do
        sign_in(@user)
        visit items_path
      end

      it { should have_selector('h3', :text => "Expiring Soon") }
      it { should have_link("Or upload an image of a receipt and we'll add your items for you") }

      describe "uploading an image" do
        before { click_link "Or upload an image of a receipt and we'll add your items for you" }

        it { should have_selector('h3', :text => 'Upload the image of your receipt') }
        it { should have_button('Choose File') }
      end


      describe "has no items" do
        # Not sure if we'll need a prompt here when we go jquery so let's hold off for now.
      end

      describe "has items" do
        before do
            visit items_path
            fill_in "item_item_kind_name", :with => @item_kind.name
        end

        ##failing because it is not triggering the autocomplete event
        it { should have_select('item_storage', :with_options => "Refrigerator") }

        describe "after the add item button is clicked" do
          before do
            click_button "Create Item"
          end
          it { should have_selector('li', :text => @user.items.first.item_kind.name) }
          it { should have_selector('li', :text => @user.items.last.item_kind.name) }
          it { should have_selector('li', :text => @user.items.last.storage) }
          it { should have_link("Remove") }
          it "has badges for where its stored"

          it "removes an item on" do
            expect { click_link "Remove" }.to change(@user.items, :count).by(-1)
          end
        end

      end
    end

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
  end
end