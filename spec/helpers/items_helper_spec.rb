require 'spec_helper'

describe ItemsHelper do
  let(:user)      { Fabricate(:user_with_items) }
  let(:item)      { user.items.first }
  let(:item_kind) { ItemKind.find(item.item_kind_id) }

  it "has a badge related to its storage location" do
    item.storage = "Pantry"
    get_storage_badge(item.storage).should eq content_tag(:span, item.storage, :class => 'label')
    item.storage = "Refrigerator"
    get_storage_badge(item.storage).should eq content_tag(:span, item.storage, :class => 'label label-inverse')
    item.storage = "Freezer"
    get_storage_badge(item.storage).should eq content_tag(:span, item.storage, :class => 'label label-info')
  end

  it "does not yield a badge if its an unrecognized location" do
    item.storage = "Yeeee haaawww"
    get_storage_badge(item.storage).should eq nil
  end

  it "lists all storage options for the item's item kind" do
    list_all_storage_options(item_kind)
    @locations.should include item_kind.locations[0].name
    @locations.should include item_kind.locations[-1].name
  end

  it "inserts the storage options for an item kind once selected" do
    @item_kind = item_kind
    insert_storage_options.should eq list_all_storage_options(@item_kind)
  end

  it "defaults to the three storage options if we can't find an item_kind" do
    @item_kind = nil
    insert_storage_options.should eq ["Refrigerator", "Freezer", "Pantry"]
  end
end
