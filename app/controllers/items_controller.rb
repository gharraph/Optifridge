class ItemsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :index]
  after_filter :reset_session, :only => :new

  def new
    @item = Item.new
  end

  def create
    @item_kind = ItemKind.find_by_name(params[:item][:item_kind_name])
    @item = current_user.items.new(:item_kind_id => @item_kind.id, :expiration => Date.today)
    respond_to do |format|
      if @item.save
        # session[:reuse_data] = params[:item]
        flash[:notice] = "Item created successfully."
        format.js
      else
        flash.now[:error] = "Something went wrong, bro."
        render new_item_path
      end
    end
  end

  def index
    @items = current_user.items
  end

  private
  def reset_session
    session[:reuse_data] = nil
  end
end
