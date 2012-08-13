class ItemsController < ApplicationController
  before_filter :signed_in_home, :only => :index
  before_filter :authenticate_user!, :only => [:create, :index]
  # after_filter :reset_session, :only => :new

  def new
    @item = Item.new
  end

  def create
    @item_kind = ItemKind.find_by_name(params[:item][:item_kind_name])
    @item = current_user.items.new(:item_kind_id => @item_kind.id, :expiration => Date.today)
    respond_to do |format|
      if @item.save
        flash[:notice] = "Item created successfully."
        format.js
        format.html { redirect_to items_path }
      else
        flash.now[:error] = "Something went wrong, bro."
        render session[:return_to] || new_item_path
      end
    end
  end

  def index
    current_user.send_weekly_email if params[:send_email] == "true"
    @items = current_user.items
    if !session[:reuse_data].nil?
      @item_kind = ItemKind.find_by_name(session[:reuse_data][:item_kind_name])
      @item = current_user.items.new(:item_kind_id => @item_kind)
    else
      @item = current_user.items.new
    end
  end

  private
    # Need to revisit this
    # def reset_session
    #   session[:reuse_data] = nil
    # end

    def signed_in_home
      redirect_to static_home_path if !user_signed_in? && request.fullpath != "/items"
    end
end
