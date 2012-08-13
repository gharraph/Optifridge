require 'spec_helper'


describe "item pages" do
  # @user = Fabricate(:@user_with_items)
  # @user.items.each do |item|
  #   item_kind = Fabricate(:item_kind)
  #   item.item_kind_id = item_kind.id
  #   shelf_life = Fabricate(:shelf_life)
  #   shelf_life.item_kind_id = item_kind.id
  #   location = Fabricate(:location)
  #   location.shelf_life_id = shelf_life.id
  # end
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
    it { should have_field("Item kind name") }
    it { should have_button('Create Item') }

    describe "logged in" do
      describe "create new item" do
        # NOTE this will break once we have the form acting as it should
        before do
          sign_in(@user)
          visit items_path
          fill_in "Item kind name", :with => "APRICOTS FRESH, RAW, CUT UP"
          click_button "Create Item"
        end

        # it {should have_selector('li:last-child .date', :text => (Date.today + 360).to_s)} Fix this
        it { should have_content "Item created successfully" }

      end
    end

    describe "logged out" do
      describe "create new item" do
        before do
          fill_in "Item kind name", :with => "APRICOTS FRESH, RAW, CUT UP"
          click_button "Create Item"
        end

        it { should have_selector('h2', :text => "Sign in") }
        it { should have_content("You need to sign in or sign up before continuing.") }

        describe "signing in redirects back to create new item" do
          before do
            sign_in(@user)
          end

          it { should have_selector('h2', :text => 'Add Items') }
          it { should have_selector('input', :with => "APRICOTS FRESH, RAW, CUT UP") }
        end
      end
    end
  end

  describe "index" do
    before { visit items_path }

    describe "logged in" do
      before do
        fill_in "Email", :with => @user.email
        fill_in "Password", :with => @user.password
        click_button "Sign in"
      end

      it { should have_selector('h3', :text => "Your Food Inventory") }

      describe "has no items" do
        # Not sure if we'll need a prompt here when we go jquery so let's hold off for now.
      end

      describe "has items" do
        before do
            visit items_path
            fill_in "Item kind name", :with => "APRICOTS FRESH, RAW, CUT UP"
            click_button "Create Item"
        end
        # Necessarily ugly for now until we have our item_kind db with real content
        it { should have_selector('li', :text => @user.items.first.item_kind.name) }
        it { should have_selector('li', :text => @user.items.last.item_kind.name) }

      end
    end

    describe "logged out" do
       it { should have_selector('h2', :text => "Sign in") }
       it { should have_content("You need to sign in or sign up before continuing.") }
    end
  end

end