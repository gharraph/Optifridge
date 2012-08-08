class ItemsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :index]

  def new
     @item = Item.new(session[:reuse_data]) || Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = "Item created successfully."
      redirect_to new_item_path
    else
      flash.now[:error] = "Something went wrong, bro."
      render new_item_path
    end
  end

  def index

  end
end
